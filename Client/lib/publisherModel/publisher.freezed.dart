// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publisher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Publisher _$PublisherFromJson(Map<String, dynamic> json) {
  return publisher.fromJson(json);
}

/// @nodoc
mixin _$Publisher {
//common
  String get publisherID => throw _privateConstructorUsedError;
  String get publisherName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String publisherID, String publisherName)
        publisher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String publisherID, String publisherName)? publisher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String publisherID, String publisherName)? publisher,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(publisher value) publisher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(publisher value)? publisher,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(publisher value)? publisher,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublisherCopyWith<Publisher> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublisherCopyWith<$Res> {
  factory $PublisherCopyWith(Publisher value, $Res Function(Publisher) then) =
      _$PublisherCopyWithImpl<$Res, Publisher>;
  @useResult
  $Res call({String publisherID, String publisherName});
}

/// @nodoc
class _$PublisherCopyWithImpl<$Res, $Val extends Publisher>
    implements $PublisherCopyWith<$Res> {
  _$PublisherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publisherID = null,
    Object? publisherName = null,
  }) {
    return _then(_value.copyWith(
      publisherID: null == publisherID
          ? _value.publisherID
          : publisherID // ignore: cast_nullable_to_non_nullable
              as String,
      publisherName: null == publisherName
          ? _value.publisherName
          : publisherName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$publisherCopyWith<$Res> implements $PublisherCopyWith<$Res> {
  factory _$$publisherCopyWith(
          _$publisher value, $Res Function(_$publisher) then) =
      __$$publisherCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String publisherID, String publisherName});
}

/// @nodoc
class __$$publisherCopyWithImpl<$Res>
    extends _$PublisherCopyWithImpl<$Res, _$publisher>
    implements _$$publisherCopyWith<$Res> {
  __$$publisherCopyWithImpl(
      _$publisher _value, $Res Function(_$publisher) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publisherID = null,
    Object? publisherName = null,
  }) {
    return _then(_$publisher(
      publisherID: null == publisherID
          ? _value.publisherID
          : publisherID // ignore: cast_nullable_to_non_nullable
              as String,
      publisherName: null == publisherName
          ? _value.publisherName
          : publisherName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$publisher extends publisher {
  _$publisher({required this.publisherID, required this.publisherName})
      : super._();

  factory _$publisher.fromJson(Map<String, dynamic> json) =>
      _$$publisherFromJson(json);

//common
  @override
  final String publisherID;
  @override
  final String publisherName;

  @override
  String toString() {
    return 'Publisher.publisher(publisherID: $publisherID, publisherName: $publisherName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$publisher &&
            (identical(other.publisherID, publisherID) ||
                other.publisherID == publisherID) &&
            (identical(other.publisherName, publisherName) ||
                other.publisherName == publisherName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, publisherID, publisherName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$publisherCopyWith<_$publisher> get copyWith =>
      __$$publisherCopyWithImpl<_$publisher>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String publisherID, String publisherName)
        publisher,
  }) {
    return publisher(publisherID, publisherName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String publisherID, String publisherName)? publisher,
  }) {
    return publisher?.call(publisherID, publisherName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String publisherID, String publisherName)? publisher,
    required TResult orElse(),
  }) {
    if (publisher != null) {
      return publisher(publisherID, publisherName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(publisher value) publisher,
  }) {
    return publisher(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(publisher value)? publisher,
  }) {
    return publisher?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(publisher value)? publisher,
    required TResult orElse(),
  }) {
    if (publisher != null) {
      return publisher(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$publisherToJson(
      this,
    );
  }
}

abstract class publisher extends Publisher {
  factory publisher(
      {required final String publisherID,
      required final String publisherName}) = _$publisher;
  publisher._() : super._();

  factory publisher.fromJson(Map<String, dynamic> json) = _$publisher.fromJson;

  @override //common
  String get publisherID;
  @override
  String get publisherName;
  @override
  @JsonKey(ignore: true)
  _$$publisherCopyWith<_$publisher> get copyWith =>
      throw _privateConstructorUsedError;
}
