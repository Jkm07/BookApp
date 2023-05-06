import 'package:client/models/userModel/userLibrary.dart';
import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../historyLoan/loan_history_user.dart';

Widget userList(BuildContext context, UserLibrary user) {
  return Column(
    children: [
      textIconButton(context, "My loans", Icons.list_alt_rounded, () {}),
      space(),
      textIconButton(
        context,
        "Loans history",
        Icons.home_filled,
            () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const LoanHistoryUser()))),
      ),
      space(),
      textIconButton(
          context, "Delete account", Icons.restore_from_trash_outlined, () {
        userDatabase.deleteUserData(user);
        loansDatabase.deleteLoanHistory(user);
        loansDatabase.deleteMyLoans(user);
        userDatabase.deleteMyAccount();
        //nawiguj do ekranu glownego!
      }),
      space(),
    ],
  );
}