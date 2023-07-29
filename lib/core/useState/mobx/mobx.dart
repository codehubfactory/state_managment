import 'package:mobx/mobx.dart';

import '../../models/state/counter.dart';

part 'mobx.g.dart';

class CounterMobx = _CounterMobx with _$CounterMobx;

abstract class _CounterMobx with Store implements CounterBase {
  @observable
  int _count = 0;

  @computed
  @override
  int get count => _count;

  @action
  @override
  void increment() {
    _count++;
  }

  @action
  @override
  void decrement() {
    _count--;
  }
}
