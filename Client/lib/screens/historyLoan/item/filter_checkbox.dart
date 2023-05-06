import 'package:flutter/material.dart';

class FilterCheckBox extends StatelessWidget {
  final String label;
  final void Function(bool?) onPress;
  final Color color;
  final bool value;

  const FilterCheckBox(this.value, this.label, this.onPress, this.color,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: -10,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w500, color: color),
            ),
            Checkbox(
              activeColor: color,
              value: value,
              onChanged: onPress,
            ),
          ],
        ),
      ),
    );
  }
}
