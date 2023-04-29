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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.bookmark_add_outlined,
          ),
        ),
        title: const Text("Add book"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.05,
              left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp,
              right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextFormField(context, "Library name", Icons.abc_outlined,
                  nameController, "Enter library name"),
              globals.space(),
              reusableTextFormField(context, "Address", Icons.home,
                  addressController, "Enter library address"),
              globals.space(),
            ],
          ),
        ),
      ),
    );
  }
}
