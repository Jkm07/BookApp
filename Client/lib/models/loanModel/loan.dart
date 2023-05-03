import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan.freezed.dart';

part 'loan.g.dart';

@freezed
class Loan with _$Loan {
  const Loan._();

  factory Loan.loan({
    //common
    required String loanID,
    required String bookID,
    required String libraryID,
    required String userID,
    required DateTime loanDate,
    required DateTime endDate,
    required bool extended,
    required bool ended,

    // depends on post type
  }) = loan;

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
}