import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;
import '../models/userModel/userLibrary.dart';

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
  void initState() {
    super.initState();
    getParameters().then((value) {
      loadedData = true;
      setState(() {
        selectedItem = user.userType;
      });
    });
  }

  getParameters() async {
    user = await globals.userDatabase.getUser(widget.user.userMail);
  }

  Widget universalContainer(String header, String text, double height,
      {Color color = Colors.white}) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: FittedBox(
        child: Text("$header: $text"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.person,
          ),
          title: FittedBox(child: Text("${widget.user.userName} - details")),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (loadedData) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: globals.scaleHeight * 2,
                  bottom: globals.scaleHeight * 2,
                  left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp,
                  right:
                      kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: kIsWeb
                          ? globals.scaleHeight * 12
                          : globals.scaleHeight * 7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            user.userType == "librarian"
                                ? "assets/image/librarian.png"
                                : "assets/image/reader.png",
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: kIsWeb
                          ? globals.scaleHeight * 12
                          : globals.scaleHeight * 7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            user.userType,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          )),
                    ),
                    globals.space(),
                    universalContainer(
                        "UserID", user.userID, globals.scaleHeight * 3),
                    globals.space(),
                    universalContainer(
                        "Email", user.userMail, globals.scaleHeight * 3),
                    globals.space(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          iconSize: 30,
                          icon: const Icon(
                            Icons.arrow_drop_down_circle_outlined,
                          ),
                          value: selectedItem,
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(
                                        child: FittedBox(
                                            child: Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ))),
                                  ))
                              .toList(),
                          onChanged: (item) async {
                            await globals.userDatabase
                                .changePermissions(widget.user.userMail, item!);
                            await getParameters();
                            setState(() {
                              selectedItem = item;
                            });
                          }),
                    ),
                    globals.space(),
                    GestureDetector(
                      onTap: () {},
                      child: universalContainer(
                          "Delete account", "",
                          globals.scaleHeight * 3,
                          color: Theme.of(context).colorScheme.error),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
