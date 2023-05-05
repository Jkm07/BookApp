import 'package:client/globals.dart';
import 'package:client/menuItems/loanHistoryElement.dart';
import 'package:flutter/material.dart';

class LoanHistory extends StatefulWidget {
  LoanHistory({Key? key, required this.screenType}) : super(key: key);

  String screenType;

  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.screenType == "user"
            ? loansDatabase.getUserLoanHistory()
            : loansDatabase.getLibraryLoans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              padding: paddingGlobal,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return space();
                },
                itemBuilder: (context, index) {
                  return LoanHistoryElement(
                    loan: snapshot.data![index],
                    screenType: widget.screenType,
                    callBack: () {
                      setState(() {});
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
