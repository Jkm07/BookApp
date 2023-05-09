import 'package:flutter/material.dart';

class QuantityNotifier extends ChangeNotifier {
  final List<int> _data;

  QuantityNotifier(int length)
      : _data = List<int>.generate(length, (index) => 0);

  bool allGreaterThanZero() => _data.every((i) => i > 0);

  void set(int index, int value) async {
    _data[index] = value;
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }
}
