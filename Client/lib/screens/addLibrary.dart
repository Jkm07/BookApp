import 'package:client/menuItems/reusableButton.dart';
import 'package:client/menuItems/reusableContainer.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/screens/usersScreen.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../globals.dart';
import '../menuItems/reusableTextFormField.dart';

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
  Library? _library;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.library?.name);
    addressController = TextEditingController(text: widget.library?.address);
    librariansID = widget.library?.librarianList.toList() ?? [];
    map = widget.library?.booksAndQuantity ?? {};
    _library = widget.library;
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  refresh() async {
    if (_library != null) {
      setState(() {
        _library = null;
      });
      _library = await libraryDatabase.getLibrary(widget.library!.libraryID);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if( widget.library == null || _library != null ){
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.bookmark_add_outlined,
            ),
          ),
          title: Text(widget.library == null ? "Add library" : "Edit library"),
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
                reusableContainer(
                    widget.library == null ? "Add librarians" : "Edit librarians",
                    widget.library == null
                        ? () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => UsersScreen(
                              callBack: (String value) {
                                librariansID.add(value);
                                print(librariansID.length);
                              },
                              search: "",
                              sort: "Default",
                              userType: "librarian",
                              screenType: "add",
                            ))))
                        : () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => UsersScreen(
                                library: _library,
                                callBack: (String value, bool remove) {
                                  if (remove) {
                                    librariansID.remove(value);
                                  } else {
                                    librariansID.add(value);
                                  }
                                  print(librariansID.length);
                                  setState(() {});
                                },
                                search: "",
                                sort: "Default",
                                userType: "librarian",
                                screenType: "edit",
                              ))));
                      refresh();
                    },
                    Theme.of(context).primaryColor),
                reusableButton(context,
                    widget.library == null ? "Add library" : "Edit library",
                        () async {
                      final isValidForm = formKey.currentState!.validate();

                      if (isValidForm) {
                        if (widget.library == null) {
                          librariansID = librariansID.toSet().toList();
                          Library newLibrary = Library.library(
                              name: nameController.text,
                              address: addressController.text,
                              librarianList: librariansID,
                              booksAndQuantity: map,
                              libraryID: Uuid().v4());
                          await libraryDatabase.addLibrary(newLibrary);
                        } else {
                          librariansID = _library!.librarianList;
                          Library newLibrary = Library.library(
                              libraryID: widget.library!.libraryID,
                              name: nameController.text,
                              address: addressController.text,
                              librarianList: librariansID,
                              booksAndQuantity: widget.library!.booksAndQuantity);
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
    }else{
      return const Center(child: CircularProgressIndicator());
    }
  }
}