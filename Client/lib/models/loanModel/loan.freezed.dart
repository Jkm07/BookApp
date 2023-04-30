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

Loan _$LoanFromJson(Map<String, dynamic> json) {
  return loan.fromJson(json);
}

/// @nodoc
mixin _$Loan {
//common
  String get loanID => throw _privateConstructorUsedError;
  String get bookID => throw _privateConstructorUsedError;
  String get customerID => throw _privateConstructorUsedError;
  String get loanDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String loanID, String bookID, String customerID,
            String loanDate, String endDate)
        loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String loanID, String bookID, String customerID,
            String loanDate, String endDate)?
        loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String loanID, String bookID, String customerID,
            String loanDate, String endDate)?
        loan,
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
  $LoanCopyWith<Loan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanCopyWith<$Res> {
  factory $LoanCopyWith(Loan value, $Res Function(Loan) then) =
      _$LoanCopyWithImpl<$Res, Loan>;
  @useResult
  $Res call(
      {String loanID,
      String bookID,
      String customerID,
      String loanDate,
      String endDate});
}

/// @nodoc
class _$LoanCopyWithImpl<$Res, $Val extends Loan>
    implements $LoanCopyWith<$Res> {
  _$LoanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loanID = null,
    Object? bookID = null,
    Object? customerID = null,
    Object? loanDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      loanID: null == loanID
          ? _value.loanID
          : loanID // ignore: cast_nullable_to_non_nullable
              as String,
      bookID: null == bookID
          ? _value.bookID
          : bookID // ignore: cast_nullable_to_non_nullable
              as String,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as String,
      loanDate: null == loanDate
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$loanCopyWith<$Res> implements $LoanCopyWith<$Res> {
  factory _$$loanCopyWith(_$loan value, $Res Function(_$loan) then) =
      __$$loanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String loanID,
      String bookID,
      String customerID,
      String loanDate,
      String endDate});
}

/// @nodoc
class __$$loanCopyWithImpl<$Res> extends _$LoanCopyWithImpl<$Res, _$loan>
    implements _$$loanCopyWith<$Res> {
  __$$loanCopyWithImpl(_$loan _value, $Res Function(_$loan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loanID = null,
    Object? bookID = null,
    Object? customerID = null,
    Object? loanDate = null,
    Object? endDate = null,
  }) {
    return _then(_$loan(
      loanID: null == loanID
          ? _value.loanID
          : loanID // ignore: cast_nullable_to_non_nullable
              as String,
      bookID: null == bookID
          ? _value.bookID
          : bookID // ignore: cast_nullable_to_non_nullable
              as String,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as String,
      loanDate: null == loanDate
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$loan extends loan {
  _$loan(
      {required this.loanID,
      required this.bookID,
      required this.customerID,
      required this.loanDate,
      required this.endDate})
      : super._();

  factory _$loan.fromJson(Map<String, dynamic> json) => _$$loanFromJson(json);

//common
  @override
  final String loanID;
  @override
  final String bookID;
  @override
  final String customerID;
  @override
  final String loanDate;
  @override
  final String endDate;

  @override
  String toString() {
    return 'Loan.loan(loanID: $loanID, bookID: $bookID, customerID: $customerID, loanDate: $loanDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loan &&
            (identical(other.loanID, loanID) || other.loanID == loanID) &&
            (identical(other.bookID, bookID) || other.bookID == bookID) &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.loanDate, loanDate) ||
                other.loanDate == loanDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, loanID, bookID, customerID, loanDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loanCopyWith<_$loan> get copyWith =>
      __$$loanCopyWithImpl<_$loan>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String loanID, String bookID, String customerID,
            String loanDate, String endDate)
        loan,
  }) {
    return loan(loanID, bookID, customerID, loanDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String loanID, String bookID, String customerID,
            String loanDate, String endDate)?
        loan,
  }) {
    return loan?.call(loanID, bookID, customerID, loanDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String loanID, String bookID, String customerID,
            String loanDate, String endDate)?
        loan,
    required TResult orElse(),
  }) {
    if (loan != null) {
      return loan(loanID, bookID, customerID, loanDate, endDate);
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

abstract class loan extends Loan {
  factory loan(
      {required final String loanID,
      required final String bookID,
      required final String customerID,
      required final String loanDate,
      required final String endDate}) = _$loan;
  loan._() : super._();

  factory loan.fromJson(Map<String, dynamic> json) = _$loan.fromJson;

  @override //common
  String get loanID;
  @override
  String get bookID;
  @override
  String get customerID;
  @override
  String get loanDate;
  @override
  String get endDate;
  @override
  @JsonKey(ignore: true)
  _$$loanCopyWith<_$loan> get copyWith => throw _privateConstructorUsedError;
}
