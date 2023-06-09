import 'package:client/screens/home/main_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;
import 'package:go_router/go_router.dart';

import '../globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _emailTextController =
      TextEditingController(text: "xuenty75@02.tml.waw.pl");
  final _passwordTextController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    return MainBackground(
      child: Scaffold(
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
                reusableTextField("Enter email address",
                    Icons.mail_outline_outlined, "email", _emailTextController),
                globals.space(),
                reusableTextField("Enter password", Icons.lock_outline,
                    "password", _passwordTextController),
                forgetPassword(context),
                globals.space(),
                firebaseButton(context, "Sign In", () {
                  final isValidForm = formKey.currentState!.validate();

                  if (isValidForm) {
                    globals.booksDatabase
                        .getAuth()!
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) async {
                      currentUser = await globals.userDatabase.getCurrentUser();
                      if (context.mounted) {
                        if (isLibrarian(currentUser)) {
                          context.go("/loans/history/librarian");
                        } else {
                          context.go("/loans/history/user");
                        }
                      }
                    }).onError((error, stackTrace) {
                      dialogTrigger(context, "Login failed", error.toString());
                    });
                  } else {
                    dialogTrigger(context, "Incorrect data",
                        "Email address or password is incorrect!");
                  }
                }),
                signUpOption(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitHeight,
    width: double.infinity,
    height: kIsWeb ? globals.scaleHeight * 18 : globals.scaleHeight * 10,
  );
}

TextFormField reusableTextField(String text, IconData icon, String fieldType,
    TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: fieldType == "password",
    enableSuggestions: fieldType != "password",
    autocorrect: fieldType != "password",
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "This field can not be empty!";
      }

      if (fieldType == "email") {
        if (value.length < 8 || !value.contains("@")) {
          return "Incorrect email";
        } else {
          return null;
        }
      }

      if (fieldType == "password") {
        if (value.length < 8) {
          return "Incorrect password";
        } else {
          return null;
        }
      }
      return null;
    },
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
      ),
      labelText: text,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: fieldType == "password"
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Widget forgetPassword(BuildContext context) {
  return Container(
    width: double.infinity,
    height: globals.scaleHeight * 2,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const FittedBox(
        child: Text(
          "Forgot Password?",
          textAlign: TextAlign.right,
        ),
      ),
      onPressed: () {
        context.push("/resetPassword");
      },
    ),
  );
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have account?",
      ),
      globals.spaceWidth(globals.scaleHeight),
      GestureDetector(
        onTap: () {
          context.push("/signUp");
        },
        child: const Text(
          " Sign Up",
        ),
      )
    ],
  );
}

Container firebaseButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: kIsWeb ? globals.scaleWidthWeb : double.infinity,
    height: globals.scaleHeight * 2,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.error;
            }
            return Theme.of(context).colorScheme.primary;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
      child: FittedBox(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ),
  );
}

Future<Future> dialogTrigger(
    BuildContext context, String titleText, String text) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleText,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          content: Text(text),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
