import 'package:client/libraryModel/library.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:client/screens/usersScreen.dart';
import 'package:client/userModel/userLibrary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  late UserLibrary user;
  bool loadedData = false;

  @override
  initState(){
    super.initState();
    getData().then((value){
      loadedData = true;
      setState(() {

      });
    });

  }

  getData() async{
    user = await globals.userDatabase.getCurrentUser();
  }

  Widget returnUserInfo(){
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
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Image.asset("assets/image/read.png", fit: BoxFit.fitHeight,),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(globals.scaleHeight),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                    "Username: " + user.userName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  globals.space(),
                  FittedBox(
                    child: Text(
                      "Email: " + user.userMail, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  globals.space(),
                  FittedBox(
                    child: Text(
                      "Account type: " + user.userType, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
          ),
        ),
        title: Text( "Account", style: TextStyle( fontSize: 20 ), ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {

        if( loadedData ){
          return SingleChildScrollView(
            padding: EdgeInsets.only( top: globals.scaleHeight * 2 , bottom: globals.scaleHeight * 2, left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp, right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                returnUserInfo(),
                globals.space(),
                if( user.userType == "admin" )... [
                  adminList(context),
                ],
                textIconButton("Logout", Icons.logout_outlined, () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  });
                },)
              ],
            ),
          );
        }
        else{
          return Center(child: CircularProgressIndicator());
        }

      }),
    );
  }
}

Widget textIconButton( String text, IconData icon, Function() onTap ){
  return Container(
    width: double.infinity,
    height: globals.scaleHeight * 2.5,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    child: ElevatedButton.icon(
      icon: Icon(
        icon, color: Colors.white,
      ),
      onPressed: onTap,
      label: SizedBox(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16),
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
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Widget adminList(BuildContext context){
  return Column(
    children: [
      textIconButton("Manage users", Icons.person_outline_outlined, () => Navigator.push(context, MaterialPageRoute(builder: ((context) => UsersScreen() ))), ),
      globals.space(),

    ],
  );
}