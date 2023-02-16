import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_json.freezed.dart';
part 'rate_json.g.dart';

@freezed
class RateJson with _$RateJson {
  const factory RateJson({
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "timestamp") required int timestamp,
    @JsonKey(name: "base") required String base,
    @JsonKey(name: "rates") required Map<String, double> rates,
  }) = _RateJson;

  factory RateJson.fromJson(Map<String, Object?> json) => _$RateJsonFromJson(json);
}
