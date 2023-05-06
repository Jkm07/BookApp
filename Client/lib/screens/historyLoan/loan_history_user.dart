import 'package:client/globals.dart';
import 'package:client/models/loanModel/loan.dart';
import 'data/loan_monad.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:grouped_list/grouped_list.dart';
import 'item/loan_library_header.dart';
import 'item/loan_history_item.dart';
import 'item/filter_checkbox.dart';

class LoanHistoryUser extends StatefulWidget {
  const LoanHistoryUser({Key? key}) : super(key: key);

  @override
  State<LoanHistoryUser> createState() => _LoanHistoryUserState();
}

class _LoanHistoryUserState extends State<LoanHistoryUser> {
  //Filters
  bool current = true;
  bool overdue = true;
  bool ended = false;

  Future<List<LoanMonad>> getLoansGroup() async {
    var loans = await loansDatabase.getUserLoanHistory(
        current: current, overdue: overdue, ended: ended);

    Iterable<Loan> loanFilter = loans;
    if (!current) {
      loanFilter = loanFilter
          .where((l) => !l.ended && l.endDate.isBefore(DateTime.now()));
    }
    if (!overdue) {
      loanFilter = loanFilter
          .where((l) => !l.ended && l.endDate.isAfter(DateTime.now()));
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
                          Theme.of(context).colorScheme.secondary)
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
                        child: GroupedListView<LoanMonad, Library>(
                          groupSeparatorBuilder: (library) =>
                              LoanLibraryHeader(library),
                          elements: snapshot.data!,
                          groupBy: (element) => element.library,
                          groupComparator: (l1, l2) =>
                              l1.libraryID == l2.libraryID ? 0 : 1,
                          separator: const Divider(
                            color: Colors.black,
                            height: 1,
                            thickness: 1,
                          ),
                          itemBuilder: (context, element) =>
                              LoanHistoryItem(element),
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
