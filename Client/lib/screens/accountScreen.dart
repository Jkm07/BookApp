import 'package:client/screens/addLibrary.dart';
import 'package:client/screens/loanHistory.dart';
import 'package:client/screens/myLoansScreen.dart';
import 'package:client/screens/librariesScreen.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:client/screens/usersScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;
import '../models/userModel/userLibrary.dart';

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
    user = await globals.userDatabase.getCurrentUser();
  }

  Widget returnUserInfo() {
    return AspectRatio(
      aspectRatio: kIsWeb ? 5 : 3 / 1,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(globals.scaleHeight),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Image.asset(
                user.userType == "user"
                    ? "assets/image/reader.png"
                    : "assets/image/librarian.png",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(globals.scaleHeight),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "Username: ${user.userName}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  globals.space(),
                  FittedBox(
                    child: Text(
                      "Email: ${user.userMail}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  globals.space(),
                  FittedBox(
                    child: Text(
                      "Account type: ${user.userType}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
        globals.space(),
        textIconButton(
            context, "Manage libraries", Icons.holiday_village_outlined, () => Navigator.push(context, MaterialPageRoute(builder: ((context) => LibrariesScreen(search: "", sort: "Default", filter: "All") ))),),
        globals.space(),
        textIconButton(
          context,
          "Add library",
          Icons.home_filled,
          () => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddLibrary()))),
        ),
        globals.space(),
        textIconButton(
          context,
          "My loans",
          Icons.home_filled,
              () => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const MyLoansScreen()))),
        ),
        globals.space(),
        textIconButton(
          context,
          "Loans history",
          Icons.home_filled,
              () => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => LoanHistory(screenType: "user")))),
        ),
        globals.space(),

      ],
    );
  }

  Widget librarianList(BuildContext context) {
    return Column(
      children: [
        textIconButton(context, "Change username", Icons.abc_outlined, () {}),
        globals.space(),
        textIconButton(context, "Change password", Icons.lock_outline, () {}),
        globals.space(),
        textIconButton(context, "Change email address",
            Icons.mail_outline_outlined, () {}),
        globals.space(),
        globals.space(),
        textIconButton(
            context, "Manage books", Icons.menu_book_outlined, () {}),
        globals.space(),
        textIconButton(
          context,
          "Loans history",
          Icons.home_filled,
              () => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => LoanHistory(screenType: "librarian")))),
        ),
        globals.space(),
      ],
    );
  }

  Widget userList(BuildContext context) {
    return Column(
      children: [
        //() => Navigator.push(context, MaterialPageRoute(builder: ((context) => UsersScreen() ))),
        textIconButton(context, "Change username", Icons.abc_outlined, () {}),
        globals.space(),
        textIconButton(context, "Change password", Icons.lock_outline, () {}),
        globals.space(),
        textIconButton(context, "Change email address",
            Icons.mail_outline_outlined, () {}),
        globals.space(),
        textIconButton(context, "My loans", Icons.list_alt_rounded, () {}),
        globals.space(),
        textIconButton(
          context,
          "Loans history",
          Icons.home_filled,
              () => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => LoanHistory(screenType: "user")))),
        ),
        globals.space(),
        textIconButton(
            context, "Delete account", Icons.restore_from_trash_outlined, () {
          globals.userDatabase.deleteUserData(user);
          globals.userDatabase.deleteMyAccount();
        }),
        globals.space(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (loadedData) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                top: globals.scaleHeight * 2,
                bottom: globals.scaleHeight * 2,
                left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp,
                right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                returnUserInfo(),
                globals.space(),
                if (user.userType == "admin") ...[
                  adminList(context),
                ] else if (user.userType == "librarian") ...[
                  librarianList(context),
                ] else if (user.userType == "user") ...[
                  userList(context),
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

Widget textIconButton(
    BuildContext context, String text, IconData icon, Function() onTap) {
  return Container(
    width: double.infinity,
    height: globals.scaleHeight * 2.5,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    child: ElevatedButton.icon(
      icon: Icon(icon),
      onPressed: onTap,
      label: SizedBox(
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.error;
            }
            return Theme.of(context).colorScheme.secondary;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}