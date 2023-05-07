import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../addLibrary.dart';
import '../librariesScreen.dart';
import '../usersScreen.dart';

Widget adminList(BuildContext context) {
  return Column(
    children: [
      textIconButton(
        context,
        "Manage users",
        Icons.person_outline_outlined,
        () => setScreen(
            UsersScreen(
              search: "",
              sort: 'default',
              userType: 'All',
              screenType: "view",
            ),
            title: "Manage Users"),
      ),
      space(),
      textIconButton(
        context,
        "Manage libraries",
        Icons.holiday_village_outlined,
        () => setScreen(
            LibrariesScreen(search: "", sort: "Default", filter: "All"),
            title: "Manage libraries"),
      ),
      space(),
      textIconButton(
        context,
        "Add library",
        Icons.home_filled,
        () => setScreen(const AddLibrary(), title: "Add library"),
      ),
      space(),
    ],
  );
}
