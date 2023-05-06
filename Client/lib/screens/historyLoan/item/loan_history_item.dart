import 'package:flutter/material.dart';
import '../data/loan_monad.dart';

class LoanHistoryItem extends StatelessWidget {
  final LoanMonad loan;

  const LoanHistoryItem(this.loan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: loan.colorOfLoan(context),
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image(
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const CircularProgressIndicator();
                }
              },
              image: NetworkImage(loan.book.images[0]),
            )),
        title: Text(loan.book.title),
        subtitle: Text(loan.dateText()),
      ),
    );
  }
}
