import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_json.freezed.dart';
part 'currency_json.g.dart';

@freezed
class CurrencyJson with _$CurrencyJson {
  const factory CurrencyJson({
    @JsonKey(name: "ID") required String id,
    @JsonKey(name: "NumCode") required String numCode,
    @JsonKey(name: "CharCode") required String charCode,
    @JsonKey(name: "Nominal") required int nominal,
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Value") required double value,
    @JsonKey(name: "Previous") required double previous,
  }) = _CurrencyJson;

  factory CurrencyJson.fromJson(Map<String, Object?> json) => _$CurrencyJsonFromJson(json);
}
