import 'package:exchange_rates/core/database/database.dart';
import 'package:exchange_rates/core/database/models/currency_db.dart';
import 'package:exchange_rates/core/database/models/rate_db.dart';
import 'package:exchange_rates/data/models/currency_json.dart';
import 'package:collection/collection.dart';

class CurrencyLocalDataSource {
  final Database database;

  CurrencyLocalDataSource({required this.database});

  Future<void> addCurrency(CurrencyJson currency) async {
    var currencyDB = database.currencyBox.get(currency.id);
    if (currencyDB == null) {
      currencyDB = CurrencyDB(
        name: currency.name,
        code: currency.charCode,
        favorite: false,
      );
      await database.currencyBox.put(currency.id, currencyDB);
    } else {
      currencyDB.name = currency.name;
      currencyDB.code = currency.charCode;
      currencyDB.save();
    }
  }

  Future<void> addRate(
      String code, DateTime date, double oldValue, double newValue) async {
    var rateDB = database.rateBox.values
        .firstWhereOrNull((e) => e.code == code && e.date == date);
    if (rateDB == null) {
      rateDB = RateDB(
        code: code,
        date: date,
        value: newValue,
        rate: newValue - oldValue,
      );
      await database.rateBox.add(rateDB);
    }
  }

  void changeFavorite(String code, bool value) {
    var currencyDB = database.currencyBox.values
        .firstWhere((element) => element.code == code);
    currencyDB.favorite = value;
    currencyDB.save();
  }

  List<CurrencyDB> getCurrencies({bool? favorite}) {
    var data = database.currencyBox.values.toList();
    if (favorite != null) {
      data = data.where((element) => element.favorite == favorite).toList();
    }
    return data;
  }

  CurrencyDB getCurrency(String code) {
    var data = database.currencyBox.values
        .where((element) => element.code == code)
        .first;
    return data;
  }

  RateDB getRates(String code) {
    var data = database.rateBox.values
        .where((element) => element.code == code)
        .toList();
    data.sort((a, b) => a.date.compareTo(b.date));

    return data.last;
  }
}
