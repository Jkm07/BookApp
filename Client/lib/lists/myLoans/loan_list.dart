import 'dart:math';
import 'package:client/globals.dart';
import 'package:client/models/loanElement/loan.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
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
    return FutureBuilder(
        future: getLoans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) {
                        return space();
                      },
                      itemBuilder: (context, index) {
                        final item =
                            generateLoanKey(snapshot.data![index], index);
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
                                      content:
                                          Text('The borrow was canceled')));
                            });
                          },
                          child: LoanListElement(
                              loanElement: snapshot.data![index],
                              quantity: _quantities[index]),
                        );
                      },
                      shrinkWrap: true,
                    ),
                    const Divider(),
                    snapshot.data!.isNotEmpty
                        ? AcceptLoanButton(
                            loans: snapshot.data!,
                            reset: reset,
                            allNotZero: _quantities.every((q) => q > 0))
                        : const EmptyLoanList()
                  ],
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
