import 'package:exchange_rates/core/database/models/currency_db.dart';
import 'package:exchange_rates/core/database/models/rate_db.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  late Box<CurrencyDB> currencyBox;
  late Box<RateDB> rateBox;

  Future<void> init() async {
    final appDocument = await getApplicationDocumentsDirectory();
    Hive.init(appDocument.path);
    Hive.registerAdapter(CurrencyDBAdapter());
    Hive.registerAdapter(RateDBAdapter());
  }

  Future<void> initBoxes() async {
    currencyBox = await Hive.openBox<CurrencyDB>('currency');
    rateBox = await Hive.openBox<RateDB>('rate');
  }
}