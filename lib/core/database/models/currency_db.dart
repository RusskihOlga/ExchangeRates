import 'package:hive/hive.dart';
part 'currency_db.g.dart';

@HiveType(typeId: 0)
class CurrencyDB extends HiveObject {
  @HiveField(0)
  String code;
  @HiveField(1)
  String name;
  @HiveField(2)
  bool favorite;

  CurrencyDB({
    required this.code,
    required this.name,
    required this.favorite,
  });
}