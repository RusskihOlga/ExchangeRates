import 'package:exchange_rates/domain/entities/chart_data.dart';
import 'package:exchange_rates/domain/entities/currency_data.dart';
import 'package:exchange_rates/domain/entities/rate_data.dart';
import 'package:exchange_rates/domain/repositories/currency_repository.dart';
import 'package:flutter_test/flutter_test.dart';

var mockRates = <RateData>[
  RateData(code: "USD", name: "Доллар США", value: 50.5, rate: 0.6),
  RateData(code: "USD", name: "Доллар США", value: 52.1, rate: 1.6),
  RateData(code: "USD", name: "Доллар США", value: 51.6, rate: -0.5),
  RateData(code: "USD", name: "Доллар США", value: 51.0, rate: -0.6),
];

var mockArchive = ChartData(
  title: 'Доллар США',
  data: {
    DateTime.now().subtract(const Duration(days: 3)): 50.5,
    DateTime.now().subtract(const Duration(days: 2)): 52.1,
    DateTime.now().subtract(const Duration(days: 1)): 51.6,
    DateTime.now(): 51,
  },
);

var mockCurrency = <CurrencyData>[
  CurrencyData(code: "USD", name: "Доллар США", favorite: false),
  CurrencyData(code: "AED", name: "Дирхам ОАЭ", favorite: false),
  CurrencyData(code: "EUR", name: "Евро", favorite: false),
];

class CurrencyRepositoryMock implements ICurrencyRepository {
  @override
  void changeFavorite(String code, bool favorite) {
    // TODO: implement changeFavorite
  }

  @override
  double convertCurrency(String code, String value) {
    var data = double.tryParse(value.replaceAll(',', '.'));
    if (data == null) throw Exception();
    var currency = mockRates.firstWhere((element) => element.code == code);
    return data * currency.value;
  }

  @override
  Future<ChartData> getArchives(int type, String code) async {
    if (type == 0) return mockArchive;
    throw Exception();
  }

  @override
  List<CurrencyData> getCurrencies() => mockCurrency;

  @override
  RateData getCurrency(String? code) {
    if (code == null) {
      return mockRates.first;
    }

    return mockRates.firstWhere((element) => element.code == code);
  }

  @override
  Future<List<RateData>> getRates() async => mockRates;
}
