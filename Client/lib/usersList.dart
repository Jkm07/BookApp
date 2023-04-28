import 'package:client/userModel/userLibrary.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  Widget UserItemList( UserLibrary user ){
    return Container(
      //height: globals.scaleHeight * 2,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: user.userType == "librarian" ? Color(0xff6b0215) : Color(0xff0b0994),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //   Container(
      //       height: globals.scaleHeight * 4,
      //       child: Image.asset( user.userType == "librarian" ? "assets/image/librarian.png" : "assets/image/reader.png", fit: BoxFit.fitHeight,),
      //     ),
      //     globals.spaceWidth(globals.scaleHeight),
      //     Center(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           FittedBox(child: Text(user.userName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),)),
      //           FittedBox(child: Text(user.userMail, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200, fontSize: 16),)),
      //         ],
      //       ),
      //     ),
      //     Icon( Icons.arrow_back_ios_new_outlined, color: Colors.white, ),
      //   ],
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: globals.userDatabase.getUsers(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView.separated(itemCount: snapshot.data!.length,
              separatorBuilder: (context, index)
              {
                return globals.space();
              },
              itemBuilder: (context, index)
              {
                return UserItemList(snapshot.data![index]);
              }
              ,shrinkWrap: true,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}