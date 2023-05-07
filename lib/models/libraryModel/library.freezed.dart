// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Library _$LibraryFromJson(Map<String, dynamic> json) {
  return libraryModel.fromJson(json);
}

/// @nodoc
mixin _$Library {
//common
  String get libraryID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get librarianList => throw _privateConstructorUsedError;
  Map<String, String> get booksAndQuantity =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String libraryID, String name, String address,
            List<String> librarianList, Map<String, String> booksAndQuantity)
        library,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String libraryID, String name, String address,
            List<String> librarianList, Map<String, String> booksAndQuantity)?
        library,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String libraryID, String name, String address,
            List<String> librarianList, Map<String, String> booksAndQuantity)?
        library,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(libraryModel value) library,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(libraryModel value)? library,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(libraryModel value)? library,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LibraryCopyWith<Library> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryCopyWith<$Res> {
  factory $LibraryCopyWith(Library value, $Res Function(Library) then) =
      _$LibraryCopyWithImpl<$Res, Library>;
  @useResult
  $Res call(
      {String libraryID,
      String name,
      String address,
      List<String> librarianList,
      Map<String, String> booksAndQuantity});
}

/// @nodoc
class _$LibraryCopyWithImpl<$Res, $Val extends Library>
    implements $LibraryCopyWith<$Res> {
  _$LibraryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryID = null,
    Object? name = null,
    Object? address = null,
    Object? librarianList = null,
    Object? booksAndQuantity = null,
  }) {
    return _then(_value.copyWith(
      libraryID: null == libraryID
          ? _value.libraryID
          : libraryID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      librarianList: null == librarianList
          ? _value.librarianList
          : librarianList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      booksAndQuantity: null == booksAndQuantity
          ? _value.booksAndQuantity
          : booksAndQuantity // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$libraryModelCopyWith<$Res> implements $LibraryCopyWith<$Res> {
  factory _$$libraryModelCopyWith(
          _$libraryModel value, $Res Function(_$libraryModel) then) =
      __$$libraryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String libraryID,
      String name,
      String address,
      List<String> librarianList,
      Map<String, String> booksAndQuantity});
}

/// @nodoc
class __$$libraryModelCopyWithImpl<$Res>
    extends _$LibraryCopyWithImpl<$Res, _$libraryModel>
    implements _$$libraryModelCopyWith<$Res> {
  __$$libraryModelCopyWithImpl(
      _$libraryModel _value, $Res Function(_$libraryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryID = null,
    Object? name = null,
    Object? address = null,
    Object? librarianList = null,
    Object? booksAndQuantity = null,
  }) {
    return _then(_$libraryModel(
      libraryID: null == libraryID
          ? _value.libraryID
          : libraryID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      librarianList: null == librarianList
          ? _value._librarianList
          : librarianList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      booksAndQuantity: null == booksAndQuantity
          ? _value._booksAndQuantity
          : booksAndQuantity // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$libraryModel extends libraryModel {
  _$libraryModel(
      {required this.libraryID,
      required this.name,
      required this.address,
      required final List<String> librarianList,
      required final Map<String, String> booksAndQuantity})
      : _librarianList = librarianList,
        _booksAndQuantity = booksAndQuantity,
        super._();

  factory _$libraryModel.fromJson(Map<String, dynamic> json) =>
      _$$libraryModelFromJson(json);

//common
  @override
  final String libraryID;
  @override
  final String name;
  @override
  final String address;
  final List<String> _librarianList;
  @override
  List<String> get librarianList {
    if (_librarianList is EqualUnmodifiableListView) return _librarianList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_librarianList);
  }

  final Map<String, String> _booksAndQuantity;
  @override
  Map<String, String> get booksAndQuantity {
    if (_booksAndQuantity is EqualUnmodifiableMapView) return _booksAndQuantity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_booksAndQuantity);
  }

  @override
  String toString() {
    return 'Library.library(libraryID: $libraryID, name: $name, address: $address, librarianList: $librarianList, booksAndQuantity: $booksAndQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$libraryModel &&
            (identical(other.libraryID, libraryID) ||
                other.libraryID == libraryID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._librarianList, _librarianList) &&
            const DeepCollectionEquality()
                .equals(other._booksAndQuantity, _booksAndQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      libraryID,
      name,
      address,
      const DeepCollectionEquality().hash(_librarianList),
      const DeepCollectionEquality().hash(_booksAndQuantity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$libraryModelCopyWith<_$libraryModel> get copyWith =>
      __$$libraryModelCopyWithImpl<_$libraryModel>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String libraryID, String name, String address,
            List<String> librarianList, Map<String, String> booksAndQuantity)
        library,
  }) {
    return library(libraryID, name, address, librarianList, booksAndQuantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String libraryID, String name, String address,
            List<String> librarianList, Map<String, String> booksAndQuantity)?
        library,
  }) {
    return library?.call(
        libraryID, name, address, librarianList, booksAndQuantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String libraryID, String name, String address,
            List<String> librarianList, Map<String, String> booksAndQuantity)?
        library,
    required TResult orElse(),
  }) {
    if (library != null) {
      return library(libraryID, name, address, librarianList, booksAndQuantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(libraryModel value) library,
  }) {
    return library(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(libraryModel value)? library,
  }) {
    return library?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(libraryModel value)? library,
    required TResult orElse(),
  }) {
    if (library != null) {
      return library(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$libraryModelToJson(
      this,
    );
  }
}

abstract class libraryModel extends Library {
  factory libraryModel(
      {required final String libraryID,
      required final String name,
      required final String address,
      required final List<String> librarianList,
      required final Map<String, String> booksAndQuantity}) = _$libraryModel;
  libraryModel._() : super._();

  factory libraryModel.fromJson(Map<String, dynamic> json) =
      _$libraryModel.fromJson;

  @override //common
  String get libraryID;
  @override
  String get name;
  @override
  String get address;
  @override
  List<String> get librarianList;
  @override
  Map<String, String> get booksAndQuantity;
  @override
  @JsonKey(ignore: true)
  _$$libraryModelCopyWith<_$libraryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
