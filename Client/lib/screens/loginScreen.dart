import 'package:client/screens/homeScreen.dart';
import 'package:client/screens/resetPassword.dart';
import 'package:client/screens/signupScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController(text: "disom17488@in2reach.com");
  TextEditingController _passwordTextController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only( top: globals.scaleHeight * 2 , bottom: globals.scaleHeight * 2, left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp, right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              globals.space(),
              logoWidget("assets/image/logo.png"),
              globals.space(),
              Center(
                child: FittedBox(
                  child: Text(
                    "Szacun Rispekt Library",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              globals.space(),
              reusableTextFormField("Enter email address", Icons.mail_outline_outlined, "email", _emailTextController),
              globals.space(),
              reusableTextFormField("Enter password", Icons.lock_outline, "password", _passwordTextController),
              forgetPassword(context),
              globals.space(),
              firebaseButton(context, "Sign In", (){
                final isValidForm = formKey.currentState!.validate();

                if( isValidForm ){
                  globals.booksDatabase.getAuth()!.signInWithEmailAndPassword(
                      email: _emailTextController.text, password: _passwordTextController.text)
                      .then((value){
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => MyHomePage())));
                  }).onError((error, stackTrace) {
                    dialogTrigger(context, "Login failed", error.toString());
                  });
                }
                else{
                  dialogTrigger(context, "Incorrect data", "Email address or password is incorrect!");
                }

              }
              ),
              signUpOption(context),
            ],
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

TextFormField reusableTextFormField(String text, IconData icon, String fieldType, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: fieldType == "password",
    enableSuggestions: fieldType != "password",
    autocorrect: fieldType != "password",
    cursorColor: Colors.white,
    validator: (value) {
      if ( value == null || value.isEmpty ) {
        return "This field can not be empty!";
      }

      if( fieldType == "email" )
      {
        if( value.length < 8 || !value.contains("@") ){
          return "Incorrect email";
        } else return null;
      }

      if( fieldType == "password" )
      {
        if( value.length < 8  ){
          return "Incorrect password";
        } else return null;
      }
    },
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
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
      child: FittedBox(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
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
        style: TextStyle(color: Colors.white70),
      ),
      globals.spaceWidth(globals.scaleHeight),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
      child: FittedBox(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.red;
            }
            return Colors.black;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
    ),
  );
}

Future<Future> dialogTrigger(BuildContext context, String titleText, String text) async{
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xffA20000),
          title: Text(titleText, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
          content: Text(text, style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text("OK", style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
  );
}