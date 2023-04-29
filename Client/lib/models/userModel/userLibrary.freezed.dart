// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userLibrary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLibrary _$UserLibraryFromJson(Map<String, dynamic> json) {
  return userLibrary.fromJson(json);
}

/// @nodoc
mixin _$UserLibrary {
//common
  String get userID => throw _privateConstructorUsedError;

  String get userName => throw _privateConstructorUsedError;

  String get userMail => throw _privateConstructorUsedError;

  String get userType => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userID, String userName, String userMail, String userType)
        user,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userID, String userName, String userMail, String userType)?
        user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userID, String userName, String userMail, String userType)?
        user,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(userLibrary value) user,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(userLibrary value)? user,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(userLibrary value)? user,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLibraryCopyWith<UserLibrary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLibraryCopyWith<$Res> {
  factory $UserLibraryCopyWith(
          UserLibrary value, $Res Function(UserLibrary) then) =
      _$UserLibraryCopyWithImpl<$Res, UserLibrary>;
  @useResult
  $Res call({String userID, String userName, String userMail, String userType});
}

/// @nodoc
class _$UserLibraryCopyWithImpl<$Res, $Val extends UserLibrary>
    implements $UserLibraryCopyWith<$Res> {
  _$UserLibraryCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? userName = null,
    Object? userMail = null,
    Object? userType = null,
  }) {
    return _then(_value.copyWith(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userMail: null == userMail
          ? _value.userMail
          : userMail // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$userLibraryCopyWith<$Res>
    implements $UserLibraryCopyWith<$Res> {
  factory _$$userLibraryCopyWith(
          _$userLibrary value, $Res Function(_$userLibrary) then) =
      __$$userLibraryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userID, String userName, String userMail, String userType});
}

/// @nodoc
class __$$userLibraryCopyWithImpl<$Res>
    extends _$UserLibraryCopyWithImpl<$Res, _$userLibrary>
    implements _$$userLibraryCopyWith<$Res> {
  __$$userLibraryCopyWithImpl(
      _$userLibrary _value, $Res Function(_$userLibrary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userID = null,
    Object? userName = null,
    Object? userMail = null,
    Object? userType = null,
  }) {
    return _then(_$userLibrary(
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userMail: null == userMail
          ? _value.userMail
          : userMail // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$userLibrary extends userLibrary {
  _$userLibrary(
      {required this.userID,
      required this.userName,
      required this.userMail,
      required this.userType})
      : super._();

  factory _$userLibrary.fromJson(Map<String, dynamic> json) =>
      _$$userLibraryFromJson(json);

//common
  @override
  final String userID;
  @override
  final String userName;
  @override
  final String userMail;
  @override
  final String userType;

  @override
  String toString() {
    return 'UserLibrary.user(userID: $userID, userName: $userName, userMail: $userMail, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$userLibrary &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userMail, userMail) ||
                other.userMail == userMail) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userID, userName, userMail, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$userLibraryCopyWith<_$userLibrary> get copyWith =>
      __$$userLibraryCopyWithImpl<_$userLibrary>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userID, String userName, String userMail, String userType)
        user,
  }) {
    return user(userID, userName, userMail, userType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String userID, String userName, String userMail, String userType)?
        user,
  }) {
    return user?.call(userID, userName, userMail, userType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String userID, String userName, String userMail, String userType)?
        user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(userID, userName, userMail, userType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(userLibrary value) user,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(userLibrary value)? user,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(userLibrary value)? user,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$userLibraryToJson(
      this,
    );
  }
}

abstract class userLibrary extends UserLibrary {
  factory userLibrary(
      {required final String userID,
      required final String userName,
      required final String userMail,
      required final String userType}) = _$userLibrary;
  userLibrary._() : super._();

  factory userLibrary.fromJson(Map<String, dynamic> json) =
      _$userLibrary.fromJson;

  @override //common
  String get userID;
  @override
  String get userName;
  @override
  String get userMail;
  @override
  String get userType;
  @override
  @JsonKey(ignore: true)
  _$$userLibraryCopyWith<_$userLibrary> get copyWith =>
      throw _privateConstructorUsedError;
}
