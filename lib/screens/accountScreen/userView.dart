import 'package:client/models/userModel/userLibrary.dart';
import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../globals.dart';

Widget userList(BuildContext context, UserLibrary user) {
  return Column(
    children: [
      textIconButton(
          context, "Delete account", Icons.restore_from_trash_outlined, () {
        userDatabase.deleteUserData(user);
        loansDatabase.deleteLoanHistory(user);
        loansDatabase.deleteMyLoans(user);
        userDatabase.deleteMyAccount();
        context.go('/login');
      }),
      space(),
    ],
  );
}
