import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../addLibrary.dart';
import '../librariesScreen.dart';
import '../historyLoan/loan_history_user.dart';
import '../myLoansScreen.dart';
import '../usersScreen.dart';

Widget adminList(BuildContext context) {
  return Column(
    children: [
      textIconButton(
        context,
        "Manage users",
        Icons.person_outline_outlined,
            () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => UsersScreen(search: "", sort: 'default', userType: 'All', screenType: "view", )))),
      ),
      space(),
      textIconButton(
        context, "Manage libraries", Icons.holiday_village_outlined, () => Navigator.push(context, MaterialPageRoute(builder: ((context) => LibrariesScreen(search: "", sort: "Default", filter: "All") ))),),
      space(),
      textIconButton(
        context,
        "Add library",
        Icons.home_filled,
            () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const AddLibrary()))),
      ),
      space(),
      textIconButton(
        context,
        "My loans",
        Icons.home_filled,
            () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const MyLoansScreen()))),
      ),
      space(),
      textIconButton(
        context,
        "Loans history",
        Icons.home_filled,
            () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const LoanHistoryUser()))),
      ),
      space(),

    ],
  );
}