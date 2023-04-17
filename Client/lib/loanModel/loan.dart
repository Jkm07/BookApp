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
    required String customerID,
    required String librarianID,
    required String loanDate,
    required String endDate,

    // depends on post type

  }) = loan;

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);
}