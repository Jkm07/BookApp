import 'package:client/globals.dart';
import 'package:client/screens/changeUserData/textFormField.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../accountScreen/textButton.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  @override
  void dispose() {
    pass1.dispose();
    pass2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: SingleChildScrollView(
          padding: paddingGlobal,
          child: Column(
            children: [
              changetextformField(context, pass1, "New password",
                  "Enter new password", Icons.lock, "password"),
              space(),
              changetextformField(context, pass2, "Confirm password",
                  "Enter new password", Icons.lock_outline_sharp, "password"),
              space(),
              textIconButton(context, "Change password",
                  Icons.published_with_changes_outlined, () async {
                final isValidForm = formKey.currentState!.validate();
                if (isValidForm && pass1.text == pass2.text) {
                  await userDatabase.changePassword(pass1.text);
                  if(context.mounted) {
                    context.go("/settings");
                  }
                } else {
                  dialogTrigger(
                      context, "Operation failed", "Passwords do not match!");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
