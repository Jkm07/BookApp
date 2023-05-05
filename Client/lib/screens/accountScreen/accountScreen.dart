import 'package:client/screens/accountScreen/textButton.dart';
import 'package:client/screens/accountScreen/userInfo.dart';
import 'package:client/screens/accountScreen/userView.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';
import '../../models/userModel/userLibrary.dart';
import '../changeUserData/changeEmailScreen.dart';
import '../changeUserData/changePasswordScreen.dart';
import '../changeUserData/changeUsernameScreen.dart';
import 'adminView.dart';
import 'librarianView.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late UserLibrary user;
  bool loadedData = false;

  @override
  initState() {
    super.initState();
    getData().then((value) {
      loadedData = true;
      setState(() {});
    });
  }

  getData() async {
    user = await userDatabase.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (loadedData) {
          return SingleChildScrollView(
            padding: paddingGlobal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                returnUserInfo(user),
                space(),
                textIconButton(
                    context,
                    "Change username",
                    Icons.abc_outlined,
                        () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ChangeUsernameScreen())))),
                space(),
                textIconButton(
                    context,
                    "Change password",
                    Icons.lock_outline,
                        () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ChangePasswordScreen())))),
                space(),
                textIconButton(
                    context,
                    "Change email address",
                    Icons.mail_outline_outlined,
                        () => Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => ChangeEmailScreen())))),
                space(),
                if (user.userType == "admin") ...[
                  adminList(context),
                ] else if (user.userType == "librarian") ...[
                  librarianList(context),
                ] else if (user.userType == "user") ...[
                  userList(context, user),
                ],
                textIconButton(
                  context,
                  "Logout",
                  Icons.logout_outlined,
                  () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    });
                  },
                )
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}