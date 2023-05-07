import 'package:flutter/material.dart';

class TextFeatureList extends StatelessWidget {
  final String _label;
  final String _value;
  final Color _color;

  const TextFeatureList(this._label, this._value, this._color, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text("$_label:",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, color: _color)),
          ),
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
