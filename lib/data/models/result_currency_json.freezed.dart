// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_currency_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResultCurrencyJson _$ResultCurrencyJsonFromJson(Map<String, dynamic> json) {
  return _ResultCurrencyJson.fromJson(json);
}

/// @nodoc
mixin _$ResultCurrencyJson {
  @JsonKey(name: 'Date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'PreviousDate')
  DateTime get previousDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PreviousURL')
  String get previousURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'Timestamp')
  DateTime get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'Valute')
  Map<String, CurrencyJson> get valute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCurrencyJsonCopyWith<ResultCurrencyJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCurrencyJsonCopyWith<$Res> {
  factory $ResultCurrencyJsonCopyWith(
          ResultCurrencyJson value, $Res Function(ResultCurrencyJson) then) =
      _$ResultCurrencyJsonCopyWithImpl<$Res, ResultCurrencyJson>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Date') DateTime date,
      @JsonKey(name: 'PreviousDate') DateTime previousDate,
      @JsonKey(name: 'PreviousURL') String previousURL,
      @JsonKey(name: 'Timestamp') DateTime timestamp,
      @JsonKey(name: 'Valute') Map<String, CurrencyJson> valute});
}

/// @nodoc
class _$ResultCurrencyJsonCopyWithImpl<$Res, $Val extends ResultCurrencyJson>
    implements $ResultCurrencyJsonCopyWith<$Res> {
  _$ResultCurrencyJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? previousDate = null,
    Object? previousURL = null,
    Object? timestamp = null,
    Object? valute = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      previousDate: null == previousDate
          ? _value.previousDate
          : previousDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      previousURL: null == previousURL
          ? _value.previousURL
          : previousURL // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valute: null == valute
          ? _value.valute
          : valute // ignore: cast_nullable_to_non_nullable
              as Map<String, CurrencyJson>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultCurrencyJsonCopyWith<$Res>
    implements $ResultCurrencyJsonCopyWith<$Res> {
  factory _$$_ResultCurrencyJsonCopyWith(_$_ResultCurrencyJson value,
          $Res Function(_$_ResultCurrencyJson) then) =
      __$$_ResultCurrencyJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Date') DateTime date,
      @JsonKey(name: 'PreviousDate') DateTime previousDate,
      @JsonKey(name: 'PreviousURL') String previousURL,
      @JsonKey(name: 'Timestamp') DateTime timestamp,
      @JsonKey(name: 'Valute') Map<String, CurrencyJson> valute});
}

/// @nodoc
class __$$_ResultCurrencyJsonCopyWithImpl<$Res>
    extends _$ResultCurrencyJsonCopyWithImpl<$Res, _$_ResultCurrencyJson>
    implements _$$_ResultCurrencyJsonCopyWith<$Res> {
  __$$_ResultCurrencyJsonCopyWithImpl(
      _$_ResultCurrencyJson _value, $Res Function(_$_ResultCurrencyJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? previousDate = null,
    Object? previousURL = null,
    Object? timestamp = null,
    Object? valute = null,
  }) {
    return _then(_$_ResultCurrencyJson(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      previousDate: null == previousDate
          ? _value.previousDate
          : previousDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      previousURL: null == previousURL
          ? _value.previousURL
          : previousURL // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valute: null == valute
          ? _value._valute
          : valute // ignore: cast_nullable_to_non_nullable
              as Map<String, CurrencyJson>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultCurrencyJson implements _ResultCurrencyJson {
  const _$_ResultCurrencyJson(
      {@JsonKey(name: 'Date') required this.date,
      @JsonKey(name: 'PreviousDate') required this.previousDate,
      @JsonKey(name: 'PreviousURL') required this.previousURL,
      @JsonKey(name: 'Timestamp') required this.timestamp,
      @JsonKey(name: 'Valute') required final Map<String, CurrencyJson> valute})
      : _valute = valute;

  factory _$_ResultCurrencyJson.fromJson(Map<String, dynamic> json) =>
      _$$_ResultCurrencyJsonFromJson(json);

  @override
  @JsonKey(name: 'Date')
  final DateTime date;
  @override
  @JsonKey(name: 'PreviousDate')
  final DateTime previousDate;
  @override
  @JsonKey(name: 'PreviousURL')
  final String previousURL;
  @override
  @JsonKey(name: 'Timestamp')
  final DateTime timestamp;
  final Map<String, CurrencyJson> _valute;
  @override
  @JsonKey(name: 'Valute')
  Map<String, CurrencyJson> get valute {
    if (_valute is EqualUnmodifiableMapView) return _valute;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_valute);
  }

  @override
  String toString() {
    return 'ResultCurrencyJson(date: $date, previousDate: $previousDate, previousURL: $previousURL, timestamp: $timestamp, valute: $valute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultCurrencyJson &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.previousDate, previousDate) ||
                other.previousDate == previousDate) &&
            (identical(other.previousURL, previousURL) ||
                other.previousURL == previousURL) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._valute, _valute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, previousDate, previousURL,
      timestamp, const DeepCollectionEquality().hash(_valute));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCurrencyJsonCopyWith<_$_ResultCurrencyJson> get copyWith =>
      __$$_ResultCurrencyJsonCopyWithImpl<_$_ResultCurrencyJson>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultCurrencyJsonToJson(
      this,
    );
  }
}

abstract class _ResultCurrencyJson implements ResultCurrencyJson {
  const factory _ResultCurrencyJson(
          {@JsonKey(name: 'Date')
              required final DateTime date,
          @JsonKey(name: 'PreviousDate')
              required final DateTime previousDate,
          @JsonKey(name: 'PreviousURL')
              required final String previousURL,
          @JsonKey(name: 'Timestamp')
              required final DateTime timestamp,
          @JsonKey(name: 'Valute')
              required final Map<String, CurrencyJson> valute}) =
      _$_ResultCurrencyJson;

  factory _ResultCurrencyJson.fromJson(Map<String, dynamic> json) =
      _$_ResultCurrencyJson.fromJson;

  @override
  @JsonKey(name: 'Date')
  DateTime get date;
  @override
  @JsonKey(name: 'PreviousDate')
  DateTime get previousDate;
  @override
  @JsonKey(name: 'PreviousURL')
  String get previousURL;
  @override
  @JsonKey(name: 'Timestamp')
  DateTime get timestamp;
  @override
  @JsonKey(name: 'Valute')
  Map<String, CurrencyJson> get valute;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCurrencyJsonCopyWith<_$_ResultCurrencyJson> get copyWith =>
      throw _privateConstructorUsedError;
}
