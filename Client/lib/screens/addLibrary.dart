import 'package:client/screens/addScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class AddLibrary extends StatefulWidget {
  const AddLibrary({Key? key}) : super(key: key);

  @override
  State<AddLibrary> createState() => _AddLibraryState();
}

class _AddLibraryState extends State<AddLibrary> {

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.bookmark_add_outlined,
          ),
        ),
        title: Text("Add book"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only( top: MediaQuery.of(context).size.height * 0.05 , bottom: MediaQuery.of(context).size.height * 0.05, left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp, right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextFormField("Library name", Icons.abc_outlined, nameController, "Enter library name"),
              globals.space(),
              reusableTextFormField("Address", Icons.home, addressController, "Enter library address"),
              globals.space(),
            ],
          ),
        ),
      ),
    );
  }
}