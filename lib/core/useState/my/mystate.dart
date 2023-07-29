import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../constant/count.dart';
import '../../models/state/counter.dart';

class CounterMyState implements CounterBase {
  static final CounterMyState _singleton = CounterMyState._internal();

  factory CounterMyState() {
    return _singleton;
  }

  CounterMyState._internal();

  int _count = Count.instance.count;
  StreamController<int> myValue = StreamController<int>();

  @override
  Stream get count => myValue.stream;

  @override
  void increment() {
    _count++;
    Count.instance.increment();
    myValue.add(_count);
  }

  @override
  void decrement() {
    _count--;
    Count.instance.decrement();
    myValue.add(_count);
  }
}
