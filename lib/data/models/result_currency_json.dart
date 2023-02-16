import 'package:exchange_rates/data/models/currency_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_currency_json.freezed.dart';
part 'result_currency_json.g.dart';

@freezed
class ResultCurrencyJson with _$ResultCurrencyJson {
  const factory ResultCurrencyJson({
    @JsonKey(name: 'Date') required DateTime date,
    @JsonKey(name: 'PreviousDate') required DateTime previousDate,
    @JsonKey(name: 'PreviousURL') required String previousURL,
    @JsonKey(name: 'Timestamp') required DateTime timestamp,
    @JsonKey(name: 'Valute') required Map<String, CurrencyJson> valute,
  }) = _ResultCurrencyJson;

  factory ResultCurrencyJson.fromJson(Map<String, Object?> json) =>
      _$ResultCurrencyJsonFromJson(json);
}
