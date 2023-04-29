import 'package:client/screens/homeScreen.dart';
import 'package:client/userModel/userLibrary.dart';
import 'package:flutter/foundation.dart';
import 'loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

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
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: globals.scaleHeight * 2,
              bottom: globals.scaleHeight * 2,
              left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp,
              right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              globals.space(),
              logoWidget("assets/image/logo.png"),
              globals.space(),
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
              globals.space(),
              reusableTextFormField("Enter username",
                  Icons.person_outline_outlined, "", _userNameTextController),
              globals.space(),
              reusableTextFormField("Enter Email", Icons.mail_outline_outlined,
                  "email", _emailTextController),
              globals.space(),
              reusableTextFormField("Enter password", Icons.lock_outline,
                  "password", _passwordTextController),
              globals.space(),
              firebaseButton(context, "Sign Up", () {
                final isValidForm = formKey.currentState!.validate();

                if (isValidForm) {
                  globals.booksDatabase
                      .getAuth()!
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) async {
                    String userID = await globals.userDatabase.getUserID();
                    UserLibrary newUser = UserLibrary.user(
                        userID: userID,
                        userName: _userNameTextController.text,
                        userMail: _emailTextController.text,
                        userType: "user");
                    globals.userDatabase.addUser(newUser);

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
    );
  }
}
