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
  String get libraryID => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;
  DateTime get loanDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  bool get extended => throw _privateConstructorUsedError;
  bool get ended => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String loanID,
            String bookID,
            String libraryID,
            String userID,
            DateTime loanDate,
            DateTime endDate,
            bool extended,
            bool ended)
        loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String loanID,
            String bookID,
            String libraryID,
            String userID,
            DateTime loanDate,
            DateTime endDate,
            bool extended,
            bool ended)?
        loan,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String loanID,
            String bookID,
            String libraryID,
            String userID,
            DateTime loanDate,
            DateTime endDate,
            bool extended,
            bool ended)?
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
      String libraryID,
      String userID,
      DateTime loanDate,
      DateTime endDate,
      bool extended,
      bool ended});
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
    Object? libraryID = null,
    Object? userID = null,
    Object? loanDate = null,
    Object? endDate = null,
    Object? extended = null,
    Object? ended = null,
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
      libraryID: null == libraryID
          ? _value.libraryID
          : libraryID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      loanDate: null == loanDate
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      extended: null == extended
          ? _value.extended
          : extended // ignore: cast_nullable_to_non_nullable
              as bool,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
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
      String libraryID,
      String userID,
      DateTime loanDate,
      DateTime endDate,
      bool extended,
      bool ended});
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
    Object? libraryID = null,
    Object? userID = null,
    Object? loanDate = null,
    Object? endDate = null,
    Object? extended = null,
    Object? ended = null,
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
      libraryID: null == libraryID
          ? _value.libraryID
          : libraryID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      loanDate: null == loanDate
          ? _value.loanDate
          : loanDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      extended: null == extended
          ? _value.extended
          : extended // ignore: cast_nullable_to_non_nullable
              as bool,
      ended: null == ended
          ? _value.ended
          : ended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$loan extends loan {
  _$loan(
      {required this.loanID,
      required this.bookID,
      required this.libraryID,
      required this.userID,
      required this.loanDate,
      required this.endDate,
      required this.extended,
      required this.ended})
      : super._();

  factory _$loan.fromJson(Map<String, dynamic> json) => _$$loanFromJson(json);

//common
  @override
  final String loanID;
  @override
  final String bookID;
  @override
  final String libraryID;
  @override
  final String userID;
  @override
  final DateTime loanDate;
  @override
  final DateTime endDate;
  @override
  final bool extended;
  @override
  final bool ended;

  @override
  String toString() {
    return 'Loan.loan(loanID: $loanID, bookID: $bookID, libraryID: $libraryID, userID: $userID, loanDate: $loanDate, endDate: $endDate, extended: $extended, ended: $ended)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loan &&
            (identical(other.loanID, loanID) || other.loanID == loanID) &&
            (identical(other.bookID, bookID) || other.bookID == bookID) &&
            (identical(other.libraryID, libraryID) ||
                other.libraryID == libraryID) &&
            (identical(other.userID, userID) || other.userID == userID) &&
            (identical(other.loanDate, loanDate) ||
                other.loanDate == loanDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.extended, extended) ||
                other.extended == extended) &&
            (identical(other.ended, ended) || other.ended == ended));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loanID, bookID, libraryID,
      userID, loanDate, endDate, extended, ended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loanCopyWith<_$loan> get copyWith =>
      __$$loanCopyWithImpl<_$loan>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String loanID,
            String bookID,
            String libraryID,
            String userID,
            DateTime loanDate,
            DateTime endDate,
            bool extended,
            bool ended)
        loan,
  }) {
    return loan(
        loanID, bookID, libraryID, userID, loanDate, endDate, extended, ended);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String loanID,
            String bookID,
            String libraryID,
            String userID,
            DateTime loanDate,
            DateTime endDate,
            bool extended,
            bool ended)?
        loan,
  }) {
    return loan?.call(
        loanID, bookID, libraryID, userID, loanDate, endDate, extended, ended);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String loanID,
            String bookID,
            String libraryID,
            String userID,
            DateTime loanDate,
            DateTime endDate,
            bool extended,
            bool ended)?
        loan,
    required TResult orElse(),
  }) {
    if (loan != null) {
      return loan(loanID, bookID, libraryID, userID, loanDate, endDate,
          extended, ended);
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
      required final String libraryID,
      required final String userID,
      required final DateTime loanDate,
      required final DateTime endDate,
      required final bool extended,
      required final bool ended}) = _$loan;
  loan._() : super._();

  factory loan.fromJson(Map<String, dynamic> json) = _$loan.fromJson;

  @override //common
  String get loanID;
  @override
  String get bookID;
  @override
  String get libraryID;
  @override
  String get userID;
  @override
  DateTime get loanDate;
  @override
  DateTime get endDate;
  @override
  bool get extended;
  @override
  bool get ended;
  @override
  @JsonKey(ignore: true)
  _$$loanCopyWith<_$loan> get copyWith => throw _privateConstructorUsedError;
}
