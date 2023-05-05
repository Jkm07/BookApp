import 'package:client/screens/changeUserData/textFormField.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../accountScreen/textButton.dart';

class ChangeUsernameScreen extends StatelessWidget {
  ChangeUsernameScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose(){
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.lock_outline,
        ),
        title: const Text("Change password"),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: paddingGlobal,
          child: Column(
            children: [
              changetextformField(context, nameController, "New username", "Enter new username", Icons.person_outline_outlined, "username"),
              space(),
              textIconButton(context, "Change username", Icons.published_with_changes_rounded, () async {
                final isValidForm = formKey.currentState!.validate();
                if(isValidForm){
                  await userDatabase.changeUsername(nameController.text);
                  Navigator.pop(context);
                }else{
                  dialogTrigger(context, "Operation failed", "Username is incorrect");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
