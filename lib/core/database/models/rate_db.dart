import 'package:hive/hive.dart';
part 'rate_db.g.dart';

@HiveType(typeId: 1)
class RateDB extends HiveObject {
  @HiveField(0)
  String code;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  double value;
  @HiveField(3)
  double rate;

  RateDB({
    required this.code,
    required this.date,
    required this.value,
    required this.rate,
  });
}