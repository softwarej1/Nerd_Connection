// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
mixin _$Feed {
  String? get photo_url => throw _privateConstructorUsedError;
  int? get post_no => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res, Feed>;
  @useResult
  $Res call({String? photo_url, int? post_no});
}

/// @nodoc
class _$FeedCopyWithImpl<$Res, $Val extends Feed>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo_url = freezed,
    Object? post_no = freezed,
  }) {
    return _then(_value.copyWith(
      photo_url: freezed == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      post_no: freezed == post_no
          ? _value.post_no
          : post_no // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedImplCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$$FeedImplCopyWith(
          _$FeedImpl value, $Res Function(_$FeedImpl) then) =
      __$$FeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? photo_url, int? post_no});
}

/// @nodoc
class __$$FeedImplCopyWithImpl<$Res>
    extends _$FeedCopyWithImpl<$Res, _$FeedImpl>
    implements _$$FeedImplCopyWith<$Res> {
  __$$FeedImplCopyWithImpl(_$FeedImpl _value, $Res Function(_$FeedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo_url = freezed,
    Object? post_no = freezed,
  }) {
    return _then(_$FeedImpl(
      photo_url: freezed == photo_url
          ? _value.photo_url
          : photo_url // ignore: cast_nullable_to_non_nullable
              as String?,
      post_no: freezed == post_no
          ? _value.post_no
          : post_no // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedImpl implements _Feed {
  _$FeedImpl({required this.photo_url, required this.post_no});

  factory _$FeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedImplFromJson(json);

  @override
  final String? photo_url;
  @override
  final int? post_no;

  @override
  String toString() {
    return 'Feed(photo_url: $photo_url, post_no: $post_no)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedImpl &&
            (identical(other.photo_url, photo_url) ||
                other.photo_url == photo_url) &&
            (identical(other.post_no, post_no) || other.post_no == post_no));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, photo_url, post_no);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      __$$FeedImplCopyWithImpl<_$FeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedImplToJson(
      this,
    );
  }
}

abstract class _Feed implements Feed {
  factory _Feed(
      {required final String? photo_url,
      required final int? post_no}) = _$FeedImpl;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$FeedImpl.fromJson;

  @override
  String? get photo_url;
  @override
  int? get post_no;
  @override
  @JsonKey(ignore: true)
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
