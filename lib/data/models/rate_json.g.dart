// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RateJson _$$_RateJsonFromJson(Map<String, dynamic> json) => _$_RateJson(
      date: DateTime.parse(json['date'] as String),
      timestamp: json['timestamp'] as int,
      base: json['base'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$_RateJsonToJson(_$_RateJson instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'timestamp': instance.timestamp,
      'base': instance.base,
      'rates': instance.rates,
    };
