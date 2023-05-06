import 'package:client/globals.dart';
import 'package:client/models/loanModel/loan.dart';
import 'package:client/models/userModel/userLibrary.dart';
import 'package:client/screens/historyLoan/item/loan_user_header.dart';
import 'data/loan_monad.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'item/loan_history_item.dart';
import 'item/filter_checkbox.dart';

class LoanHistoryLibrarian extends StatefulWidget {
  const LoanHistoryLibrarian({Key? key}) : super(key: key);

  @override
  State<LoanHistoryLibrarian> createState() => _LoanHistoryLibrarianState();
}

class _LoanHistoryLibrarianState extends State<LoanHistoryLibrarian> {
  //Filters
  bool current = true;
  bool overdue = true;
  bool ended = false;

  Future<List<LoanMonad>> getLoansGroup() async {
    var loans = await loansDatabase.getLibraryLoans(
        current: current, overdue: overdue, ended: ended);

    Iterable<Loan> loanFilter = loans;
    if (!current) {
      loanFilter = loanFilter
          .where((l) => l.ended || l.endDate.isBefore(DateTime.now()));
    }
    if (!overdue) {
      loanFilter =
          loanFilter.where((l) => l.ended || l.endDate.isAfter(DateTime.now()));
    }
    loans = loanFilter.toList();

    List<LoanMonad> out = [];
    for (var loan in loans) {
      var library = out.firstWhereOrNull(
          (element) => loan.libraryID == element.library.libraryID);
      var book =
          out.firstWhereOrNull((element) => loan.bookID == element.book.bookID);
      var user =
          out.firstWhereOrNull((element) => loan.userID == element.user.userID);
      out.add(await LoanMonad.create(
          loan, library?.library, book?.book, user?.user));
    }
    return out;
  }

  void extendLoan(LoanMonad loanMonad) async {
    var loan = await loansDatabase.getLoanByID(loanMonad.loan.loanID);
    if (!loan.extended) {
      await loansDatabase.extendLoan(loan);
    }
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(!loan.extended
              ? "Success. You extended a loan"
              : "Fail. Try again")));
    }
  }

  void endLoan(LoanMonad loanMonad) async {
    var loan = await loansDatabase.getLoanByID(loanMonad.loan.loanID);
    if (!loan.ended) {
      await loansDatabase.endLoan(loan, loanMonad.book, loanMonad.library);
    }
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              !loan.ended ? "Success. You ended a loan" : "Fail. Try again")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLoansGroup(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              margin: paddingGlobal,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilterCheckBox(
                          current,
                          "Current",
                          (f) => setState(() {
                                current = f!;
                              }),
                          Theme.of(context).colorScheme.primary),
                      FilterCheckBox(
                          overdue,
                          "Overdue",
                          (f) => setState(() {
                                overdue = f!;
                              }),
                          Theme.of(context).colorScheme.error),
                      FilterCheckBox(
                          ended,
                          "Ended",
                          (f) => setState(() {
                                ended = f!;
                              }),
                          Theme.of(context).colorScheme.surface)
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GroupedListView<LoanMonad, UserLibrary>(
                          groupSeparatorBuilder: (user) => LoanUserHeader(user),
                          elements: snapshot.data!,
                          groupBy: (element) => element.user,
                          groupComparator: (l1, l2) =>
                              l1.userID == l2.userID ? 0 : 1,
                          separator: const Divider(
                            color: Colors.black,
                            height: 1,
                            thickness: 1,
                          ),
                          itemBuilder: (context, element) =>
                              LoanHistoryItem(element, extendLoan, endLoan),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
