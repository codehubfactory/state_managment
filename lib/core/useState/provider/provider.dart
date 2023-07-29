import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_managment/core/useState/mobx/mobx.dart';

import '../../constant/count.dart';
import '../../models/state/counter.dart';
import '../my/mystate.dart';

class CounterProvider
    with ChangeNotifier, DiagnosticableTreeMixin
    implements CounterBase {
  int _count = Count.instance.count;

  @override
  int get count => Count.instance.count;

  @override
  void increment() {
    
    Count.instance.increment();
    // CounterMyState().myValue.add(Count.instance.count);
    notifyListeners();
  }

  @override
  void decrement() {
    Count.instance.decrement();
    // CounterMyState().myValue.add(Count.instance.count);
    notifyListeners();
  }
}
