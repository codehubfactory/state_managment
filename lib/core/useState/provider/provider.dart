import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/state/counter.dart';

class CounterProvider
    with ChangeNotifier, DiagnosticableTreeMixin
    implements CounterBase {
  int _count = 0;

  @override
  int get count => _count;

  @override
  void increment() {
    print(_count);
    _count++;
    notifyListeners();
  }

  @override
  void decrement() {
    print(_count);
    _count--;
    notifyListeners();
  }
}
