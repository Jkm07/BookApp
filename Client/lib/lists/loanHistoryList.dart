import 'package:client/globals.dart';
import 'package:flutter/material.dart';

import '../menuItems/loanHistoryElement.dart';

class LoanHistoryList extends StatefulWidget {
  LoanHistoryList({Key? key, required this.screenType}) : super(key: key);

  String screenType;

  @override
  State<LoanHistoryList> createState() => _LoanHistoryListState();
}

class _LoanHistoryListState extends State<LoanHistoryList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.screenType == "user"
            ? loansDatabase.getUserLoanHistory()
            : loansDatabase.getLibraryLoans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return space();
              },
              itemBuilder: (context, index) {
                return LoanHistoryElement(
                  loan: snapshot.data![index],
                  screenType: widget.screenType,
                );
              },
              shrinkWrap: true,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
