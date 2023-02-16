import 'package:exchange_rates/data/data_sources/currency_local_data_source.dart';
import 'package:exchange_rates/data/data_sources/currency_remote_data_source.dart';
import 'package:exchange_rates/domain/entities/chart_data.dart';
import 'package:exchange_rates/domain/entities/currency_data.dart';
import 'package:exchange_rates/domain/entities/rate_data.dart';
import 'package:intl/intl.dart';

abstract class ICurrencyRepository {
  List<CurrencyData> getCurrencies();
  Future<List<RateData>> getRates();
  void changeFavorite(String code, bool favorite);
  RateData getCurrency(String? code);
  double convertCurrency(String code, String value);
  Future<ChartData> getArchives(int type, String code);
}

class CurrencyRepository implements ICurrencyRepository {
  final CurrencyLocalDataSource localSource;
  final CurrencyRemoteDataSource remoteSource;

  CurrencyRepository({
    required this.localSource,
    required this.remoteSource,
  });

  @override
  List<CurrencyData> getCurrencies() {
    var data = localSource.getCurrencies();
    return data
        .map((e) => CurrencyData(
              code: e.code,
              name: e.name,
              favorite: e.favorite,
            ))
        .toList();
  }

  @override
  Future<List<RateData>> getRates() async {
    try {
      var data = localSource.getCurrencies();
      if (data.isEmpty) {
        var currencies = await remoteSource.getCurrencies();
        for (var item in currencies.valute.values) {
          await localSource.addCurrency(item);

          await localSource.addRate(
            item.charCode,
            currencies.date,
            item.previous,
            item.value,
          );
        }
      } else {
        var lastData = await remoteSource.getLastCurrencies();
        for (var item in lastData.rates.entries) {
          var lastData = localSource.getRates(item.key);
          var newValue = 1.0 / item.value;
          await localSource.addRate(
            item.key,
            lastData.date,
            lastData.value,
            newValue,
          );
        }
      }
    } catch (_) {}
    List<RateData> result = [];
    var currenciesDB = localSource.getCurrencies(favorite: true);
    for (var item in currenciesDB) {
      var rate = localSource.getRates(item.code);
      result.add(RateData(
        code: item.code,
        name: item.name,
        value: rate.value,
        rate: rate.rate,
      ));
    }
    return result;
  }

  @override
  void changeFavorite(String code, bool favorite) {
    localSource.changeFavorite(code, favorite);
  }

  @override
  RateData getCurrency(String? code) {
    var currency = code == null
        ? localSource.getCurrencies().first
        : localSource
            .getCurrencies()
            .firstWhere((element) => element.code == code);
    var rate = localSource.getRates(currency.code);
    return RateData(
      code: rate.code,
      name: currency.name,
      value: rate.value,
      rate: rate.rate,
    );
  }

  @override
  double convertCurrency(String code, String value) {
    var data = double.tryParse(value.replaceAll(',', '.'));
    if (data == null) throw Exception();
    var currency = localSource.getRates(code);
    return data * currency.value;
  }

  @override
  Future<ChartData> getArchives(int type, String code) async {
    var dateEnd = DateTime.now();
    var dateStart = dateEnd.subtract(const Duration(days: 7));
    if (type == 1) dateStart = dateEnd.subtract(const Duration(days: 30));

    Map<DateTime, double> result = {};
    var format = DateFormat("yyyy/MM/dd");
    while (dateStart.isBefore(dateEnd)) {
      var data = await remoteSource.getArchives(format.format(dateStart));
      if (data != null) {
        var currency = data.valute[code];
        if (currency != null) {
          result[dateStart] = currency.value;
        }
      }
      dateStart = dateStart.add(const Duration(days: 1));
    }
    if (result.isEmpty) throw Exception();

    return ChartData(title: getCurrency(code).name, data: result);
  }
}
