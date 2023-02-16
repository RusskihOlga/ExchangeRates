// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_currency_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResultCurrencyJson _$$_ResultCurrencyJsonFromJson(
        Map<String, dynamic> json) =>
    _$_ResultCurrencyJson(
      date: DateTime.parse(json['Date'] as String),
      previousDate: DateTime.parse(json['PreviousDate'] as String),
      previousURL: json['PreviousURL'] as String,
      timestamp: DateTime.parse(json['Timestamp'] as String),
      valute: (json['Valute'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, CurrencyJson.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_ResultCurrencyJsonToJson(
        _$_ResultCurrencyJson instance) =>
    <String, dynamic>{
      'Date': instance.date.toIso8601String(),
      'PreviousDate': instance.previousDate.toIso8601String(),
      'PreviousURL': instance.previousURL,
      'Timestamp': instance.timestamp.toIso8601String(),
      'Valute': instance.valute,
    };
