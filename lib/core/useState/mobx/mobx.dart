import 'package:mobx/mobx.dart';

import '../../constant/count.dart';
import '../../models/state/counter.dart';

part 'mobx.g.dart';

class CounterMobx = _CounterMobx with _$CounterMobx;

abstract class _CounterMobx with Store implements CounterBase {
  @observable
  int _count = Count.instance.count;

  @computed
  @override
  int get count => _count;

  @action
  @override
  void increment() {
    Count.instance.increment();
    _count++;
  }

  @action
  @override
  void decrement() {
    Count.instance.decrement();
    _count--;
  }
}
