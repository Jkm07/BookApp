import 'package:client/screens/historyLoan/loan_history_librarian.dart';
import 'package:client/screens/historyLoan/loan_history_user.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as global;

class LoanHistory extends StatelessWidget {
  const LoanHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: global.userDatabase.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (global.isLibrarian(snapshot.data!)) {
              return const LoanHistoryLibrarian();
            } else {
              return const LoanHistoryUser();
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
