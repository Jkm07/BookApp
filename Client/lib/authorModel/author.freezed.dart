// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return author.fromJson(json);
}

/// @nodoc
mixin _$Author {
//common
  String get authorID => throw _privateConstructorUsedError;

  String get authorName => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authorID, String authorName) author,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authorID, String authorName)? author,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authorID, String authorName)? author,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(author value) author,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(author value)? author,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(author value)? author,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call({String authorID, String authorName});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorID = null,
    Object? authorName = null,
  }) {
    return _then(_value.copyWith(
      authorID: null == authorID
          ? _value.authorID
          : authorID // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$authorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$authorCopyWith(_$author value, $Res Function(_$author) then) =
      __$$authorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authorID, String authorName});
}

/// @nodoc
class __$$authorCopyWithImpl<$Res> extends _$AuthorCopyWithImpl<$Res, _$author>
    implements _$$authorCopyWith<$Res> {
  __$$authorCopyWithImpl(_$author _value, $Res Function(_$author) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorID = null,
    Object? authorName = null,
  }) {
    return _then(_$author(
      authorID: null == authorID
          ? _value.authorID
          : authorID // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$author extends author {
  _$author({required this.authorID, required this.authorName}) : super._();

  factory _$author.fromJson(Map<String, dynamic> json) =>
      _$$authorFromJson(json);

//common
  @override
  final String authorID;
  @override
  final String authorName;

  @override
  String toString() {
    return 'Author.author(authorID: $authorID, authorName: $authorName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$author &&
            (identical(other.authorID, authorID) ||
                other.authorID == authorID) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorID, authorName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$authorCopyWith<_$author> get copyWith =>
      __$$authorCopyWithImpl<_$author>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String authorID, String authorName) author,
  }) {
    return author(authorID, authorName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String authorID, String authorName)? author,
  }) {
    return author?.call(authorID, authorName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String authorID, String authorName)? author,
    required TResult orElse(),
  }) {
    if (author != null) {
      return author(authorID, authorName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(author value) author,
  }) {
    return author(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(author value)? author,
  }) {
    return author?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(author value)? author,
    required TResult orElse(),
  }) {
    if (author != null) {
      return author(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$authorToJson(
      this,
    );
  }
}

abstract class author extends Author {
  factory author(
      {required final String authorID,
      required final String authorName}) = _$author;
  author._() : super._();

  factory author.fromJson(Map<String, dynamic> json) = _$author.fromJson;

  @override //common
  String get authorID;
  @override
  String get authorName;
  @override
  @JsonKey(ignore: true)
  _$$authorCopyWith<_$author> get copyWith =>
      throw _privateConstructorUsedError;
}
