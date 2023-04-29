import 'package:client/screens/loginScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
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
              reusableTextFormField("Enter Email", Icons.mail_outline_outlined,
                  "email", _emailTextController),
              globals.space(),
              firebaseButton(context, "Reset Password", () {
                final isValidForm = formKey.currentState!.validate();

                if (isValidForm) {
                  globals.booksDatabase
                      .getAuth()!
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => dialogTrigger(context, "Reset Password",
                          "Password reset email has been sent to the provided email address!"))
                      .then((value) => Navigator.of(context).pop());
                } else {
                  dialogTrigger(context, "Email issue", "Incorrect Email");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
