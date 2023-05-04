import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextFormField reusableTextFormField(BuildContext context, String label,
    IconData icon, TextEditingController controller, String hintText, [TextInputType? inputType, List<TextInputFormatter>? inputFormatter] ) {
  return TextFormField(
    controller: controller,
    enableSuggestions: true,
    autocorrect: true,
    keyboardType: inputType,
    inputFormatters: inputFormatter,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "This field can't be empty";
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      icon: Icon(icon),
      hintText: hintText,
      labelText: label,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 3),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
        BorderSide(color: Theme.of(context).colorScheme.primary, width: 5),
      ),
    ),
  );
}