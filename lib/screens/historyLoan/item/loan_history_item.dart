import 'package:flutter/material.dart';
import '../data/loan_monad.dart';
import 'text_feature_list.dart';
import 'action_button.dart';

class HorizontalDivider extends SizedBox {
  const HorizontalDivider({super.key}) : super(height: 9);
}

class LoanHistoryItem extends StatelessWidget {
  final LoanMonad loan;
  final void Function(LoanMonad loan)? extend;
  final void Function(LoanMonad loan)? end;

  const LoanHistoryItem(this.loan, this.extend, this.end, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: loan.colorOfLoan(context),
      child: ExpansionTile(
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
        textColor: loan.colorOfText(context),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextFeatureList("User", loan.user.userName,
                          loan.colorOfText(context)),
                      const HorizontalDivider(),
                      TextFeatureList("Status", loan.getStatusOfLoan(),
                          loan.colorOfText(context)),
                      const HorizontalDivider(),
                      TextFeatureList("Library", loan.library.address,
                          loan.colorOfText(context)),
                      const HorizontalDivider(),
                      TextFeatureList(
                          "Loan date",
                          "${loan.loan.loanDate.day}.${loan.loan.loanDate.month}.${loan.loan.loanDate.year}",
                          loan.colorOfText(context)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ActionButton(loan, extend, "Extend",
                          Theme.of(context).colorScheme.primary),
                      const HorizontalDivider(),
                      ActionButton(loan, end, "End",
                          Theme.of(context).colorScheme.surface),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
