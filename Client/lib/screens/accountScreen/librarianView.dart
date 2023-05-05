import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../loanHistory.dart';

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
                builder: ((context) => LoanHistory(screenType: "librarian")))),
      ),
      space(),
    ],
  );
}
