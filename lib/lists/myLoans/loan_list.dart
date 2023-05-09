import 'dart:math';
import 'package:client/globals.dart';
import 'package:client/lists/myLoans/data/QuanityNotifier.dart';
import 'package:client/models/loanElement/loan.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item/loan_element.dart';
import 'item/accept_loan_button.dart';
import 'item/empty_loan_list.dart';

class LoanElementList extends StatefulWidget {
  const LoanElementList({Key? key}) : super(key: key);

  @override
  State<LoanElementList> createState() => _LoanElementListState();
}

class _LoanElementListState extends State<LoanElementList> {
  final _quantities = <int>[];
  final _confettiController = ConfettiController();

  String generateLoanKey(LoanElement loan, int index) {
    return "${index}_${loan.bookID}_${loan.libraryID}";
  }

  Future<List<LoanElement>> getLoans() async {
    List<LoanElement> loans = await loansDatabase.getAllUserLoans();
    for (var loan in loans) {
      _quantities.add(await loansDatabase.validateLoan(loan));
    }
    return loans;
  }

  void reset() {
    _confettiController.play();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _confettiController.duration = const Duration(seconds: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LoanElement>>.value(
      value: loansDatabase.userLoansStream,
      builder: (context, snapshot) {
        final data = Provider.of<List<LoanElement>>(context);
        return Stack(
          alignment: Alignment.center,
          children: [
            ChangeNotifierProvider(
              create: (context) => QuantityNotifier(data.length),
              child: Column(
                children: [
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: data.length,
                    separatorBuilder: (context, index) {
                      return space();
                    },
                    itemBuilder: (context, index) {
                      final item = generateLoanKey(data[index], index);
                      return Dismissible(
                        key: Key(item),
                        onDismissed: (direction) async {
                          await loansDatabase.deleteBookOnLoanList(
                              data[index].bookID, data[index].libraryID);
                          setState(() {
                            data.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('The borrow was canceled')));
                          });
                        },
                        child: LoanListElement(
                          loanElement: data[index],
                          index: index,
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  data.isNotEmpty
                      ? AcceptLoanButton(loans: data, reset: reset)
                      : const EmptyLoanList()
                ],
              ),
            ),
            ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi / 2,
                emissionFrequency: 0.1,
                gravity: 0.1,
                particleDrag: 0.1,
                blastDirectionality: BlastDirectionality.explosive)
          ],
        );
      },
      initialData: const [],
    );
  }
}
