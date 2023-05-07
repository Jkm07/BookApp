import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan.freezed.dart';

part 'loan.g.dart';

@freezed
class LoanElement with _$LoanElement{
  const LoanElement._();

  factory LoanElement.loan({
    //common
    required String bookID,
    required String libraryID,
    required String quantity,

    // depends on post type
  }) = loan;

  factory LoanElement.fromJson(Map<String, dynamic> json) => _$LoanElementFromJson(json);
}