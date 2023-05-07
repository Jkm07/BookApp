import 'package:flutter/material.dart';

class TextFeatureList extends StatelessWidget {
  final String _label;
  final String _value;

  const TextFeatureList(this._label, this._value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Text("$_label:",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary)),
          Expanded(
            child: Text(_value,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary)),
          ),
        ],
      ),
    );
  }
}
