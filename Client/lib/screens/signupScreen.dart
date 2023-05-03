import 'package:client/screens/home/home_screen.dart';
import 'package:client/screens/home/main_background.dart';
import 'package:flutter/foundation.dart';
import '../globals.dart';
import '../models/userModel/userLibrary.dart';
import 'loginScreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final _passwordTextController = TextEditingController();
  final _userNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Scaffold(
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: SingleChildScrollView(
            padding: paddingGlobal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                space(),
                logoWidget("assets/image/logo.png"),
                space(),
                const Center(
                  child: FittedBox(
                    child: Text(
                      "Szacun Rispekt Library",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                space(),
                reusableTextField("Enter username",
                    Icons.person_outline_outlined, "", _userNameTextController),
                space(),
                reusableTextField("Enter Email", Icons.mail_outline_outlined,
                    "email", _emailTextController),
                space(),
                reusableTextField("Enter password", Icons.lock_outline,
                    "password", _passwordTextController),
                space(),
                firebaseButton(context, "Sign Up", () {
                  final isValidForm = formKey.currentState!.validate();

                  if (isValidForm) {
                    booksDatabase
                        .getAuth()!
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) async {
                      String userID = await userDatabase.getUserID();
                      UserLibrary newUser = UserLibrary.user(
                          userID: userID,
                          userName: _userNameTextController.text,
                          userMail: _emailTextController.text,
                          userType: "user");
                      userDatabase.addUser(newUser);
                      loansDatabase.createLoanRecordForUser();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    }).onError((error, stackTrace) {
                      dialogTrigger(
                          context, "Registration failed", error.toString());
                    });
                  } else {
                    dialogTrigger(context, "Incorrect data",
                        "Email address, password or username is incorrect!");
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
