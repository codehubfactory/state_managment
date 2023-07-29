import 'package:flutter/material.dart';

class Count extends ChangeNotifier {
  static Count? _instance;
  static Count get instance {
    _instance ??= Count._init();
    return _instance!;
  }

  Count._init();

  int count = 0;

  void increment() {
    Count.instance.count++;
    notifyListeners();
  }

  @override
  void decrement() {
    Count.instance.count--;
    notifyListeners();
  }

  // int get count => _count;
}
