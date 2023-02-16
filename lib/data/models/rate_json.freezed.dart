// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RateJson _$RateJsonFromJson(Map<String, dynamic> json) {
  return _RateJson.fromJson(json);
}

/// @nodoc
mixin _$RateJson {
  @JsonKey(name: "date")
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: "timestamp")
  int get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: "base")
  String get base => throw _privateConstructorUsedError;
  @JsonKey(name: "rates")
  Map<String, double> get rates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateJsonCopyWith<RateJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateJsonCopyWith<$Res> {
  factory $RateJsonCopyWith(RateJson value, $Res Function(RateJson) then) =
      _$RateJsonCopyWithImpl<$Res, RateJson>;
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "timestamp") int timestamp,
      @JsonKey(name: "base") String base,
      @JsonKey(name: "rates") Map<String, double> rates});
}

/// @nodoc
class _$RateJsonCopyWithImpl<$Res, $Val extends RateJson>
    implements $RateJsonCopyWith<$Res> {
  _$RateJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timestamp = null,
    Object? base = null,
    Object? rates = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RateJsonCopyWith<$Res> implements $RateJsonCopyWith<$Res> {
  factory _$$_RateJsonCopyWith(
          _$_RateJson value, $Res Function(_$_RateJson) then) =
      __$$_RateJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "date") DateTime date,
      @JsonKey(name: "timestamp") int timestamp,
      @JsonKey(name: "base") String base,
      @JsonKey(name: "rates") Map<String, double> rates});
}

/// @nodoc
class __$$_RateJsonCopyWithImpl<$Res>
    extends _$RateJsonCopyWithImpl<$Res, _$_RateJson>
    implements _$$_RateJsonCopyWith<$Res> {
  __$$_RateJsonCopyWithImpl(
      _$_RateJson _value, $Res Function(_$_RateJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timestamp = null,
    Object? base = null,
    Object? rates = null,
  }) {
    return _then(_$_RateJson(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      rates: null == rates
          ? _value._rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RateJson implements _RateJson {
  const _$_RateJson(
      {@JsonKey(name: "date") required this.date,
      @JsonKey(name: "timestamp") required this.timestamp,
      @JsonKey(name: "base") required this.base,
      @JsonKey(name: "rates") required final Map<String, double> rates})
      : _rates = rates;

  factory _$_RateJson.fromJson(Map<String, dynamic> json) =>
      _$$_RateJsonFromJson(json);

  @override
  @JsonKey(name: "date")
  final DateTime date;
  @override
  @JsonKey(name: "timestamp")
  final int timestamp;
  @override
  @JsonKey(name: "base")
  final String base;
  final Map<String, double> _rates;
  @override
  @JsonKey(name: "rates")
  Map<String, double> get rates {
    if (_rates is EqualUnmodifiableMapView) return _rates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rates);
  }

  @override
  String toString() {
    return 'RateJson(date: $date, timestamp: $timestamp, base: $base, rates: $rates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RateJson &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.base, base) || other.base == base) &&
            const DeepCollectionEquality().equals(other._rates, _rates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, timestamp, base,
      const DeepCollectionEquality().hash(_rates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RateJsonCopyWith<_$_RateJson> get copyWith =>
      __$$_RateJsonCopyWithImpl<_$_RateJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateJsonToJson(
      this,
    );
  }
}

abstract class _RateJson implements RateJson {
  const factory _RateJson(
          {@JsonKey(name: "date") required final DateTime date,
          @JsonKey(name: "timestamp") required final int timestamp,
          @JsonKey(name: "base") required final String base,
          @JsonKey(name: "rates") required final Map<String, double> rates}) =
      _$_RateJson;

  factory _RateJson.fromJson(Map<String, dynamic> json) = _$_RateJson.fromJson;

  @override
  @JsonKey(name: "date")
  DateTime get date;
  @override
  @JsonKey(name: "timestamp")
  int get timestamp;
  @override
  @JsonKey(name: "base")
  String get base;
  @override
  @JsonKey(name: "rates")
  Map<String, double> get rates;
  @override
  @JsonKey(ignore: true)
  _$$_RateJsonCopyWith<_$_RateJson> get copyWith =>
      throw _privateConstructorUsedError;
}
