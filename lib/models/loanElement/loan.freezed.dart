// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoanElement _$LoanElementFromJson(Map<String, dynamic> json) {
  return loan.fromJson(json);
}

/// @nodoc
mixin _$LoanElement {
//common
  String get bookID => throw _privateConstructorUsedError;
  String get libraryID => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookID, String libraryID, String quantity)
        loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookID, String libraryID, String quantity)? loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookID, String libraryID, String quantity)? loan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(loan value) loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(loan value)? loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(loan value)? loan,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoanElementCopyWith<LoanElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanElementCopyWith<$Res> {
  factory $LoanElementCopyWith(
          LoanElement value, $Res Function(LoanElement) then) =
      _$LoanElementCopyWithImpl<$Res, LoanElement>;
  @useResult
  $Res call({String bookID, String libraryID, String quantity});
}

/// @nodoc
class _$LoanElementCopyWithImpl<$Res, $Val extends LoanElement>
    implements $LoanElementCopyWith<$Res> {
  _$LoanElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookID = null,
    Object? libraryID = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      bookID: null == bookID
          ? _value.bookID
          : bookID // ignore: cast_nullable_to_non_nullable
              as String,
      libraryID: null == libraryID
          ? _value.libraryID
          : libraryID // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$loanCopyWith<$Res> implements $LoanElementCopyWith<$Res> {
  factory _$$loanCopyWith(_$loan value, $Res Function(_$loan) then) =
      __$$loanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bookID, String libraryID, String quantity});
}

/// @nodoc
class __$$loanCopyWithImpl<$Res> extends _$LoanElementCopyWithImpl<$Res, _$loan>
    implements _$$loanCopyWith<$Res> {
  __$$loanCopyWithImpl(_$loan _value, $Res Function(_$loan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookID = null,
    Object? libraryID = null,
    Object? quantity = null,
  }) {
    return _then(_$loan(
      bookID: null == bookID
          ? _value.bookID
          : bookID // ignore: cast_nullable_to_non_nullable
              as String,
      libraryID: null == libraryID
          ? _value.libraryID
          : libraryID // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$loan extends loan {
  _$loan(
      {required this.bookID, required this.libraryID, required this.quantity})
      : super._();

  factory _$loan.fromJson(Map<String, dynamic> json) => _$$loanFromJson(json);

//common
  @override
  final String bookID;
  @override
  final String libraryID;
  @override
  final String quantity;

  @override
  String toString() {
    return 'LoanElement.loan(bookID: $bookID, libraryID: $libraryID, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loan &&
            (identical(other.bookID, bookID) || other.bookID == bookID) &&
            (identical(other.libraryID, libraryID) ||
                other.libraryID == libraryID) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookID, libraryID, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loanCopyWith<_$loan> get copyWith =>
      __$$loanCopyWithImpl<_$loan>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String bookID, String libraryID, String quantity)
        loan,
  }) {
    return loan(bookID, libraryID, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String bookID, String libraryID, String quantity)? loan,
  }) {
    return loan?.call(bookID, libraryID, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String bookID, String libraryID, String quantity)? loan,
    required TResult orElse(),
  }) {
    if (loan != null) {
      return loan(bookID, libraryID, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(loan value) loan,
  }) {
    return loan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(loan value)? loan,
  }) {
    return loan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(loan value)? loan,
    required TResult orElse(),
  }) {
    if (loan != null) {
      return loan(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$loanToJson(
      this,
    );
  }
}

abstract class loan extends LoanElement {
  factory loan(
      {required final String bookID,
      required final String libraryID,
      required final String quantity}) = _$loan;
  loan._() : super._();

  factory loan.fromJson(Map<String, dynamic> json) = _$loan.fromJson;

  @override //common
  String get bookID;
  @override
  String get libraryID;
  @override
  String get quantity;
  @override
  @JsonKey(ignore: true)
  _$$loanCopyWith<_$loan> get copyWith => throw _privateConstructorUsedError;
}
