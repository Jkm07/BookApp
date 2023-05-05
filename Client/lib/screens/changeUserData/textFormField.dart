import 'package:flutter/material.dart';

Widget changetextformField(BuildContext context, TextEditingController controller, String label, String hint, IconData icon, String fieldType){
  return TextFormField(
    controller: controller,
    obscureText: fieldType == "password",
    enableSuggestions: fieldType != "password",
    autocorrect: fieldType != "password",
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "This field can not be empty!";
      }

      if (fieldType == "email") {
        if (value.length < 8 || !value.contains("@")) {
          return "Incorrect email";
        } else {
          return null;
        }
      }

      if (fieldType == "password") {
        if (value.length < 8) {
          return "Incorrect password";
        } else {
          return null;
        }
      }
      return null;
    },
    decoration: InputDecoration(
      icon: Icon(
        icon,
      ),
      hintText: hint,
      labelText: label,
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