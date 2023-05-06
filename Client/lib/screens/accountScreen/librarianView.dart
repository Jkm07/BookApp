import 'package:client/screens/accountScreen/textButton.dart';
import 'package:client/screens/historyLoan/loan_history_librarian.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';

Widget librarianList(BuildContext context) {
  return Column(
    children: [
      textIconButton(context, "Manage books", Icons.menu_book_outlined, () {}),
      space(),
      textIconButton(
        context,
        "Loans history",
        Icons.home_filled,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => const LoanHistoryLibrarian()))),
      ),
      space(),
    ],
  );
}
