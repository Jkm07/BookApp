import 'package:flutter/material.dart';

import '../screens/addScreen.dart';

List<Widget> getAuthors(List<String> authorsList, Function onTap) {
  List<Widget> authorsTextFields = [];
  for (int i = 0; i < authorsList.length; i++) {
    authorsTextFields.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(child: AuthorTextFormFields(i)),
          const SizedBox(
            width: 16,
          ),
          _addRemoveButton(i == authorsList.length - 1, i, onTap),
        ],
      ),
    ));
  }
  return authorsTextFields;
}

Widget _addRemoveButton(bool add, int index, Function onTap) {
  return InkWell(
    onTap: () => onTap(add, index),
    child: Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: (add) ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
          (add) ? Icons.add_box_rounded : Icons.highlight_remove_outlined),
    ),
  );
}

class AuthorTextFormFields extends StatefulWidget {
  final int index;

  AuthorTextFormFields(this.index);

  @override
  State<AuthorTextFormFields> createState() => AuthorTextFormFieldsState();
}

class AuthorTextFormFieldsState extends State<AuthorTextFormFields> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      nameController.text = BookCreatorState.authorsList[widget.index];
    });

    return TextFormField(
      controller: nameController,
      enableSuggestions: true,
      autocorrect: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can't be empty";
        } else {
          return null;
        }
      },
      onChanged: (v) => BookCreatorState.authorsList[widget.index] = v,
      decoration: InputDecoration(
        icon: const Icon(Icons.person_add_alt_1),
        hintText: "Enter author",
        labelText: "Author",
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 5),
        ),
      ),
    );
  }
}