import 'package:client/screens/userDetails.dart';
import 'package:client/userModel/userLibrary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  Widget userItemList(UserLibrary user) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserDetails(user: user)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: user.userType == "librarian"
                ? const Color(0xff6b0215)
                : const Color(0xff0b0994),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
          height: globals.scaleHeight * 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  user.userType == "librarian"
                      ? "assets/image/librarian.png"
                      : "assets/image/reader.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              globals.spaceWidth(
                  kIsWeb ? globals.scaleHeight * 3 : globals.scaleHeight),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FittedBox(
                        child: Text(
                      user.userName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    )),
                    FittedBox(
                        child: Text(
                      user.userMail,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    )),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: globals.userDatabase.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return globals.space();
              },
              itemBuilder: (context, index) {
                return userItemList(snapshot.data![index]);
              },
              shrinkWrap: true,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
