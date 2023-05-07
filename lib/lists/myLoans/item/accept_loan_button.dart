import 'package:client/globals.dart' as global;
import 'package:client/models/loanElement/loan.dart';
import 'package:flutter/material.dart';

class AcceptLoanButton extends StatelessWidget {
  final bool allNotZero;
  final List<LoanElement> loans;
  final void Function() reset;

  void clickButton(BuildContext context) async {
    bool isSuccess = await global.loansDatabase.acceptBorrowList(loans);
    reset();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(isSuccess
              ? "Success. You added book to your borrow list"
              : "Fail. Try again")));
    }
  }

  const AcceptLoanButton(
      {super.key,
      required this.loans,
      required this.reset,
      required this.allNotZero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: allNotZero ? () => clickButton(context) : null,
      child: Ink(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: const Text(
            "Borrow all books",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
