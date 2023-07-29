import 'dart:async';

import '../../models/state/counter.dart';

class CounterMyState implements CounterBase {
  static final CounterMyState _singleton = CounterMyState._internal();

  factory CounterMyState() {
    return _singleton;
  }

  CounterMyState._internal();

  int _count = 0;
  StreamController<int> myValue = StreamController<int>();

  @override
  Stream get count => myValue.stream;

  @override
  void increment() {
    myValue.add(_count++);
  }

  @override
  void decrement() {
    myValue.add(_count--);
  }
}
