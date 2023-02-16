// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyJson _$CurrencyJsonFromJson(Map<String, dynamic> json) {
  return _CurrencyJson.fromJson(json);
}

/// @nodoc
mixin _$CurrencyJson {
  @JsonKey(name: "ID")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "NumCode")
  String get numCode => throw _privateConstructorUsedError;
  @JsonKey(name: "CharCode")
  String get charCode => throw _privateConstructorUsedError;
  @JsonKey(name: "Nominal")
  int get nominal => throw _privateConstructorUsedError;
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Value")
  double get value => throw _privateConstructorUsedError;
  @JsonKey(name: "Previous")
  double get previous => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyJsonCopyWith<CurrencyJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyJsonCopyWith<$Res> {
  factory $CurrencyJsonCopyWith(
          CurrencyJson value, $Res Function(CurrencyJson) then) =
      _$CurrencyJsonCopyWithImpl<$Res, CurrencyJson>;
  @useResult
  $Res call(
      {@JsonKey(name: "ID") String id,
      @JsonKey(name: "NumCode") String numCode,
      @JsonKey(name: "CharCode") String charCode,
      @JsonKey(name: "Nominal") int nominal,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Value") double value,
      @JsonKey(name: "Previous") double previous});
}

/// @nodoc
class _$CurrencyJsonCopyWithImpl<$Res, $Val extends CurrencyJson>
    implements $CurrencyJsonCopyWith<$Res> {
  _$CurrencyJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numCode = null,
    Object? charCode = null,
    Object? nominal = null,
    Object? name = null,
    Object? value = null,
    Object? previous = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numCode: null == numCode
          ? _value.numCode
          : numCode // ignore: cast_nullable_to_non_nullable
              as String,
      charCode: null == charCode
          ? _value.charCode
          : charCode // ignore: cast_nullable_to_non_nullable
              as String,
      nominal: null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyJsonCopyWith<$Res>
    implements $CurrencyJsonCopyWith<$Res> {
  factory _$$_CurrencyJsonCopyWith(
          _$_CurrencyJson value, $Res Function(_$_CurrencyJson) then) =
      __$$_CurrencyJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ID") String id,
      @JsonKey(name: "NumCode") String numCode,
      @JsonKey(name: "CharCode") String charCode,
      @JsonKey(name: "Nominal") int nominal,
      @JsonKey(name: "Name") String name,
      @JsonKey(name: "Value") double value,
      @JsonKey(name: "Previous") double previous});
}

/// @nodoc
class __$$_CurrencyJsonCopyWithImpl<$Res>
    extends _$CurrencyJsonCopyWithImpl<$Res, _$_CurrencyJson>
    implements _$$_CurrencyJsonCopyWith<$Res> {
  __$$_CurrencyJsonCopyWithImpl(
      _$_CurrencyJson _value, $Res Function(_$_CurrencyJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numCode = null,
    Object? charCode = null,
    Object? nominal = null,
    Object? name = null,
    Object? value = null,
    Object? previous = null,
  }) {
    return _then(_$_CurrencyJson(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numCode: null == numCode
          ? _value.numCode
          : numCode // ignore: cast_nullable_to_non_nullable
              as String,
      charCode: null == charCode
          ? _value.charCode
          : charCode // ignore: cast_nullable_to_non_nullable
              as String,
      nominal: null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      previous: null == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyJson implements _CurrencyJson {
  const _$_CurrencyJson(
      {@JsonKey(name: "ID") required this.id,
      @JsonKey(name: "NumCode") required this.numCode,
      @JsonKey(name: "CharCode") required this.charCode,
      @JsonKey(name: "Nominal") required this.nominal,
      @JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Value") required this.value,
      @JsonKey(name: "Previous") required this.previous});

  factory _$_CurrencyJson.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyJsonFromJson(json);

  @override
  @JsonKey(name: "ID")
  final String id;
  @override
  @JsonKey(name: "NumCode")
  final String numCode;
  @override
  @JsonKey(name: "CharCode")
  final String charCode;
  @override
  @JsonKey(name: "Nominal")
  final int nominal;
  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Value")
  final double value;
  @override
  @JsonKey(name: "Previous")
  final double previous;

  @override
  String toString() {
    return 'CurrencyJson(id: $id, numCode: $numCode, charCode: $charCode, nominal: $nominal, name: $name, value: $value, previous: $previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numCode, numCode) || other.numCode == numCode) &&
            (identical(other.charCode, charCode) ||
                other.charCode == charCode) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, numCode, charCode, nominal, name, value, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyJsonCopyWith<_$_CurrencyJson> get copyWith =>
      __$$_CurrencyJsonCopyWithImpl<_$_CurrencyJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyJsonToJson(
      this,
    );
  }
}

abstract class _CurrencyJson implements CurrencyJson {
  const factory _CurrencyJson(
          {@JsonKey(name: "ID") required final String id,
          @JsonKey(name: "NumCode") required final String numCode,
          @JsonKey(name: "CharCode") required final String charCode,
          @JsonKey(name: "Nominal") required final int nominal,
          @JsonKey(name: "Name") required final String name,
          @JsonKey(name: "Value") required final double value,
          @JsonKey(name: "Previous") required final double previous}) =
      _$_CurrencyJson;

  factory _CurrencyJson.fromJson(Map<String, dynamic> json) =
      _$_CurrencyJson.fromJson;

  @override
  @JsonKey(name: "ID")
  String get id;
  @override
  @JsonKey(name: "NumCode")
  String get numCode;
  @override
  @JsonKey(name: "CharCode")
  String get charCode;
  @override
  @JsonKey(name: "Nominal")
  int get nominal;
  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Value")
  double get value;
  @override
  @JsonKey(name: "Previous")
  double get previous;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyJsonCopyWith<_$_CurrencyJson> get copyWith =>
      throw _privateConstructorUsedError;
}
