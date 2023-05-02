import 'package:client/screens/userDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import '../globals.dart';
import '../models/libraryModel/library.dart';
import '../models/userModel/userLibrary.dart';

class UsersList extends StatefulWidget {
  UsersList(
      {Key? key,
      required this.search,
      required this.sort,
      required this.userType,
      required this.screenType,
      this.callBack,
      this.library})
      : super(key: key);

  String search;
  String sort;
  String userType;
  String screenType;
  Function? callBack;
  Library? library;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {

  Library? _library;

  @override
  void initState(){
    _library = widget.library;
  }

  Widget userItemList(UserLibrary user) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserDetails(user: user)));
        setState(() {

        });
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
              if (widget.screenType == "view") ...[
                const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
              ] else if (widget.screenType == "add") ...[
                GestureDetector(
                  onTap: () => widget.callBack!(user.userID),
                  child: Container(
                    child: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                ),
              ] else if (widget.screenType == "edit") ...[
                GestureDetector(
                  onTap: () async {
                    if(_library!.librarianList.contains(user.userID)){
                      var newList = _library!.librarianList.toList();
                      newList.remove(user.userID);
                      await libraryDatabase.updateLibrary(_library!.copyWith(librarianList: newList));
                      setState(() {
                        _library = _library!.copyWith(librarianList: newList);
                      });
                    }else{
                      var newList = _library!.librarianList.toList();
                      newList.add(user.userID);
                      await libraryDatabase.updateLibrary(_library!.copyWith(librarianList: newList));
                      setState(() {
                        _library = _library!.copyWith(librarianList: newList);
                      });
                    }
                  },
                  child: Container(
                    child: _library!.librarianList.contains(user.userID)
                        ? const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.screenType == "view" ? userDatabase.getUsers(widget.search, widget.sort, widget.userType) :
            userDatabase.getLibrarians(widget.search, widget.sort, widget.userType, widget.library),
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