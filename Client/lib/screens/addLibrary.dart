import 'package:client/menuItems/reusableButton.dart';
import 'package:client/menuItems/reusableContainer.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/screens/addScreen.dart';
import 'package:client/screens/usersScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../globals.dart';
import 'loginScreen.dart';

class AddLibrary extends StatefulWidget {
  const AddLibrary({Key? key, this.library}) : super(key: key);

  final Library? library;

  @override
  State<AddLibrary> createState() => _AddLibraryState();
}

class _AddLibraryState extends State<AddLibrary> {

  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController addressController;
  late List<String> librariansID;
  late Map<String, String> map;

  @override void initState(){
    super.initState();
    nameController = TextEditingController(text: widget.library?.name);
    addressController = TextEditingController(text: widget.library?.address);
    librariansID = widget.library?.librarianList.toList() ?? [];
    map = widget.library?.booksAndQuantity ?? {};
  }

  @override void dispose(){
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
        title: Text( widget.library == null ? "Add library" : "Edit library"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: paddingGlobal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextFormField(context, "Library name", Icons.abc_outlined,
                  nameController, "Enter library name"),
              space(),
              reusableTextFormField(context, "Address", Icons.home,
                  addressController, "Enter library address"),
              space(),
              reusableContainer( widget.library == null ? "Add librarians" : "Edit librarians" ,widget.library == null ? () => Navigator.push(context, MaterialPageRoute(builder: ((context) => UsersScreen( callBack: (String value) { librariansID.add(value); print(librariansID.length); }, search: "", sort: "Default", userType: "librarian", screenType: "add", ) ))) :
                  () => Navigator.push(context, MaterialPageRoute(builder: ((context) => UsersScreen( library: widget.library, callBack: (String value, bool remove) { if (remove) { librariansID.remove(value); } else {librariansID.add(value); } print(librariansID.length); }, search: "", sort: "Default", userType: "librarian", screenType: "edit", ) ))), Theme.of(context).primaryColor ),
              reusableButton(context, widget.library == null ? "Add library" : "Edit library", () async {
                final isValidForm = formKey.currentState!.validate();

                // if( librariansID.isEmpty ){
                //   dialogTrigger(context, "Empty list", "Librarians list can not be empty");
                //   return;
                // }

                if( isValidForm ){
                  librariansID = librariansID.toSet().toList();
                  if( widget.library == null ){
                    Library newLibrary = Library.library(name: nameController.text, address: addressController.text, librarianList: librariansID, booksAndQuantity: map, libraryID: Uuid().v4());
                    await libraryDatabase.addLibrary(newLibrary);
                  }
                  else{
                    Library newLibrary = Library.library(libraryID: widget.library!.libraryID, name: nameController.text, address: addressController.text, librarianList: librariansID, booksAndQuantity: widget.library!.booksAndQuantity);
                    await libraryDatabase.updateLibrary(newLibrary);
                  }

                  Navigator.pop(context);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}