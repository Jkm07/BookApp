import 'package:client/globals.dart';
import 'package:client/menuItems/loanElement.dart';
import 'package:client/models/loanElement/loan.dart';
import 'package:flutter/material.dart';
import 'accept_loan_button.dart';

class LoanElementList extends StatefulWidget {
  const LoanElementList({Key? key}) : super(key: key);

  @override
  State<LoanElementList> createState() => _LoanElementListState();
}

class _LoanElementListState extends State<LoanElementList> {
  var quantities = <int>[];

  String generateLoanKey(LoanElement loan, int index) {
    return "${index}_${loan.bookID}_${loan.libraryID}";
  }

  Future<List<LoanElement>> getLoans() async {
    List<LoanElement> loans = await loansDatabase.getAllUserLoans();
    for (var loan in loans) {
      quantities.add(await loansDatabase.validateLoan(loan));
    }
    return loans;
  }

  void reset() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getLoans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) {
                    return space();
                  },
                  itemBuilder: (context, index) {
                    final item = generateLoanKey(snapshot.data![index], index);
                    return Dismissible(
                      key: Key(item),
                      onDismissed: (direction) async {
                        await loansDatabase.deleteBookOnLoanList(
                            snapshot.data![index].bookID,
                            snapshot.data![index].libraryID);
                        setState(() {
                          snapshot.data!.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('The borrow was canceled')));
                        });
                      },
                      child: LoanListElement(
                          loanElement: snapshot.data![index],
                          quantity: quantities[index]),
                    );
                  },
                  shrinkWrap: true,
                ),
                const Divider(),
                snapshot.data!.isNotEmpty
                    ? AcceptLoanButton(
                        loans: snapshot.data!,
                        reset: reset,
                        allNotZero: quantities.every((q) => q > 0))
                    : const Text("Borrow list empty")
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
