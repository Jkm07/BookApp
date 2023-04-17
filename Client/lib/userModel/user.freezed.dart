// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  switch (json['userType']) {
    case 'reader':
      return UserReader.fromJson(json);
    case 'librarian':
      return UserLibrarian.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'userType', 'User',
          'Invalid union type "${json['userType']}"!');
  }
}

/// @nodoc
mixin _$User {
//common
  String get userName => throw _privateConstructorUsedError;
  String get userSurname => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userName, String userSurname, String userType, String userID)
        reader,
    required TResult Function(
            String userName, String userSurname, String userType, String userID)
        librarian,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName, String userSurname, String userType,
            String userID)?
        reader,
    TResult? Function(String userName, String userSurname, String userType,
            String userID)?
        librarian,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName, String userSurname, String userType,
            String userID)?
        reader,
    TResult Function(String userName, String userSurname, String userType,
            String userID)?
        librarian,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserReader value) reader,
    required TResult Function(UserLibrarian value) librarian,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserReader value)? reader,
    TResult? Function(UserLibrarian value)? librarian,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserReader value)? reader,
    TResult Function(UserLibrarian value)? librarian,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String userName, String userSurname, String userType, String userID});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userSurname = null,
    Object? userType = null,
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userSurname: null == userSurname
          ? _value.userSurname
          : userSurname // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserReaderCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserReaderCopyWith(
          _$UserReader value, $Res Function(_$UserReader) then) =
      __$$UserReaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName, String userSurname, String userType, String userID});
}

/// @nodoc
class __$$UserReaderCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserReader>
    implements _$$UserReaderCopyWith<$Res> {
  __$$UserReaderCopyWithImpl(
      _$UserReader _value, $Res Function(_$UserReader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userSurname = null,
    Object? userType = null,
    Object? userID = null,
  }) {
    return _then(_$UserReader(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userSurname: null == userSurname
          ? _value.userSurname
          : userSurname // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserReader extends UserReader {
  _$UserReader(
      {required this.userName,
      required this.userSurname,
      required this.userType,
      required this.userID})
      : super._();

  factory _$UserReader.fromJson(Map<String, dynamic> json) =>
      _$$UserReaderFromJson(json);

//common
  @override
  final String userName;
  @override
  final String userSurname;
  @override
  final String userType;
  @override
  final String userID;

  @override
  String toString() {
    return 'User.reader(userName: $userName, userSurname: $userSurname, userType: $userType, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserReader &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userSurname, userSurname) ||
                other.userSurname == userSurname) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, userSurname, userType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserReaderCopyWith<_$UserReader> get copyWith =>
      __$$UserReaderCopyWithImpl<_$UserReader>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userName, String userSurname, String userType, String userID)
        reader,
    required TResult Function(
            String userName, String userSurname, String userType, String userID)
        librarian,
  }) {
    return reader(userName, userSurname, userType, userID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName, String userSurname, String userType,
            String userID)?
        reader,
    TResult? Function(String userName, String userSurname, String userType,
            String userID)?
        librarian,
  }) {
    return reader?.call(userName, userSurname, userType, userID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName, String userSurname, String userType,
            String userID)?
        reader,
    TResult Function(String userName, String userSurname, String userType,
            String userID)?
        librarian,
    required TResult orElse(),
  }) {
    if (reader != null) {
      return reader(userName, userSurname, userType, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserReader value) reader,
    required TResult Function(UserLibrarian value) librarian,
  }) {
    return reader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserReader value)? reader,
    TResult? Function(UserLibrarian value)? librarian,
  }) {
    return reader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserReader value)? reader,
    TResult Function(UserLibrarian value)? librarian,
    required TResult orElse(),
  }) {
    if (reader != null) {
      return reader(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserReaderToJson(
      this,
    );
  }
}

abstract class UserReader extends User {
  factory UserReader(
      {required final String userName,
      required final String userSurname,
      required final String userType,
      required final String userID}) = _$UserReader;
  UserReader._() : super._();

  factory UserReader.fromJson(Map<String, dynamic> json) =
      _$UserReader.fromJson;

  @override //common
  String get userName;
  @override
  String get userSurname;
  @override
  String get userType;
  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$UserReaderCopyWith<_$UserReader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLibrarianCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserLibrarianCopyWith(
          _$UserLibrarian value, $Res Function(_$UserLibrarian) then) =
      __$$UserLibrarianCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName, String userSurname, String userType, String userID});
}

/// @nodoc
class __$$UserLibrarianCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserLibrarian>
    implements _$$UserLibrarianCopyWith<$Res> {
  __$$UserLibrarianCopyWithImpl(
      _$UserLibrarian _value, $Res Function(_$UserLibrarian) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userSurname = null,
    Object? userType = null,
    Object? userID = null,
  }) {
    return _then(_$UserLibrarian(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userSurname: null == userSurname
          ? _value.userSurname
          : userSurname // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLibrarian extends UserLibrarian {
  _$UserLibrarian(
      {required this.userName,
      required this.userSurname,
      required this.userType,
      required this.userID})
      : super._();

  factory _$UserLibrarian.fromJson(Map<String, dynamic> json) =>
      _$$UserLibrarianFromJson(json);

//common
  @override
  final String userName;
  @override
  final String userSurname;
  @override
  final String userType;
  @override
  final String userID;

  @override
  String toString() {
    return 'User.librarian(userName: $userName, userSurname: $userSurname, userType: $userType, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLibrarian &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userSurname, userSurname) ||
                other.userSurname == userSurname) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, userSurname, userType, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLibrarianCopyWith<_$UserLibrarian> get copyWith =>
      __$$UserLibrarianCopyWithImpl<_$UserLibrarian>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String userName, String userSurname, String userType, String userID)
        reader,
    required TResult Function(
            String userName, String userSurname, String userType, String userID)
        librarian,
  }) {
    return librarian(userName, userSurname, userType, userID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userName, String userSurname, String userType,
            String userID)?
        reader,
    TResult? Function(String userName, String userSurname, String userType,
            String userID)?
        librarian,
  }) {
    return librarian?.call(userName, userSurname, userType, userID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userName, String userSurname, String userType,
            String userID)?
        reader,
    TResult Function(String userName, String userSurname, String userType,
            String userID)?
        librarian,
    required TResult orElse(),
  }) {
    if (librarian != null) {
      return librarian(userName, userSurname, userType, userID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserReader value) reader,
    required TResult Function(UserLibrarian value) librarian,
  }) {
    return librarian(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserReader value)? reader,
    TResult? Function(UserLibrarian value)? librarian,
  }) {
    return librarian?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserReader value)? reader,
    TResult Function(UserLibrarian value)? librarian,
    required TResult orElse(),
  }) {
    if (librarian != null) {
      return librarian(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLibrarianToJson(
      this,
    );
  }
}

abstract class UserLibrarian extends User {
  factory UserLibrarian(
      {required final String userName,
      required final String userSurname,
      required final String userType,
      required final String userID}) = _$UserLibrarian;
  UserLibrarian._() : super._();

  factory UserLibrarian.fromJson(Map<String, dynamic> json) =
      _$UserLibrarian.fromJson;

  @override //common
  String get userName;
  @override
  String get userSurname;
  @override
  String get userType;
  @override
  String get userID;
  @override
  @JsonKey(ignore: true)
  _$$UserLibrarianCopyWith<_$UserLibrarian> get copyWith =>
      throw _privateConstructorUsedError;
}
