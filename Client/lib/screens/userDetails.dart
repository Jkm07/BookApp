import 'package:client/userModel/userLibrary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key, required this.user}) : super(key: key);

  final UserLibrary user;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  late String selectedItem;
  late UserLibrary user;
  final items = ["user", "librarian", "admin"];
  bool loadedData = false;

  @override
  void initState(){
    super.initState();
    getParameters().then((value){
      loadedData = true;
      setState(() {
        selectedItem = user.userType;
      });
    });
  }

  getParameters() async{
    user = await globals.userDatabase.getUser(widget.user.userMail);
  }

  Widget universalContainer(String header, String text, double height, { Color color = Colors.black } ){
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: FittedBox(
        child: Text(
          header + ": " + text, style: TextStyle(color: Colors.white,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: Icon(
            Icons.person,
          ),
        title: FittedBox(child: Text(widget.user.userName + " - details")),
      ),
      body: LayoutBuilder(builder: (context, constraints) {

        if(loadedData){
          return SingleChildScrollView(
            padding: EdgeInsets.only(top: globals.scaleHeight * 2,
                bottom: globals.scaleHeight * 2,
                left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp,
                right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: kIsWeb ? globals.scaleHeight * 12 : globals.scaleHeight * 7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(user.userType == "librarian"
                            ? "assets/image/librarian.png"
                            : "assets/image/reader.png", fit: BoxFit.fitHeight,)
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    width: kIsWeb ? globals.scaleHeight * 12 : globals
                        .scaleHeight * 7,
                    child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(user.userType,
                          style: TextStyle(fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18),)
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                  ),
                  globals.space(),
                  universalContainer(
                      "UserID", user.userID, globals.scaleHeight * 3),
                  globals.space(),
                  universalContainer(
                      "Email", user.userMail, globals.scaleHeight * 3),
                  globals.space(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      iconSize: 35,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined,
                        color: Colors.white,),
                      dropdownColor: Colors.black54,
                      value: selectedItem,
                      items: items
                          .map((String item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Center(child: FittedBox(child: Text(item,
                              style: TextStyle(fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),))),
                          ))
                          .toList(),
                      onChanged: (item) async {
                        await globals.userDatabase.changePermissions(widget.user.userMail, item!);
                        await getParameters();
                        setState(() {
                          selectedItem = item!;
                        });
                      }
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: universalContainer("", "Delete account", globals.scaleHeight * 3, color: Colors.red),
                  ),
                ],
              ),
            ),
          );
        } else{
          return Center(child: CircularProgressIndicator());
        }
      })
    );
  }
}