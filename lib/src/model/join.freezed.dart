// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Join _$JoinFromJson(Map<String, dynamic> json) {
  return _Join.fromJson(json);
}

/// @nodoc
mixin _$Join {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JoinCopyWith<Join> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinCopyWith<$Res> {
  factory $JoinCopyWith(Join value, $Res Function(Join) then) =
      _$JoinCopyWithImpl<$Res, Join>;
  @useResult
  $Res call({String id, String name, String password});
}

/// @nodoc
class _$JoinCopyWithImpl<$Res, $Val extends Join>
    implements $JoinCopyWith<$Res> {
  _$JoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JoinImplCopyWith<$Res> implements $JoinCopyWith<$Res> {
  factory _$$JoinImplCopyWith(
          _$JoinImpl value, $Res Function(_$JoinImpl) then) =
      __$$JoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String password});
}

/// @nodoc
class __$$JoinImplCopyWithImpl<$Res>
    extends _$JoinCopyWithImpl<$Res, _$JoinImpl>
    implements _$$JoinImplCopyWith<$Res> {
  __$$JoinImplCopyWithImpl(_$JoinImpl _value, $Res Function(_$JoinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? password = null,
  }) {
    return _then(_$JoinImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinImpl implements _Join {
  _$JoinImpl({required this.id, required this.name, required this.password});

  factory _$JoinImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String password;

  @override
  String toString() {
    return 'Join(id: $id, name: $name, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinImplCopyWith<_$JoinImpl> get copyWith =>
      __$$JoinImplCopyWithImpl<_$JoinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinImplToJson(
      this,
    );
  }
}

abstract class _Join implements Join {
  factory _Join(
      {required final String id,
      required final String name,
      required final String password}) = _$JoinImpl;

  factory _Join.fromJson(Map<String, dynamic> json) = _$JoinImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$JoinImplCopyWith<_$JoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
