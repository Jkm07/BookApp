import 'package:client/screens/changeUserData/textFormField.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../globals.dart';
import '../accountScreen/textButton.dart';

class ChangeEmailScreen extends StatelessWidget {
  ChangeEmailScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
              changetextformField(context, emailController, "New email",
                  "Enter new email", Icons.mail_outline_outlined, "email"),
              space(),
              textIconButton(
                  context, "Change email", Icons.change_circle_outlined,
                  () async {
                final isValidForm = formKey.currentState!.validate();
                if (isValidForm) {
                  await userDatabase.changeEmail(emailController.text);
                  if (context.mounted) {
                    context.go("/settings");
                  }
                } else {
                  dialogTrigger(context, "Operation failed",
                      "This email address is incorrect!");
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
