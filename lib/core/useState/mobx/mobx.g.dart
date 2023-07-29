// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterMobx on _CounterMobx, Store {
  Computed<int>? _$countComputed;

  @override
  int get count => (_$countComputed ??=
          Computed<int>(() => super.count, name: '_CounterMobx.count'))
      .value;

  late final _$_countAtom = Atom(name: '_CounterMobx._count', context: context);

  @override
  int get _count {
    _$_countAtom.reportRead();
    return super._count;
  }

  @override
  set _count(int value) {
    _$_countAtom.reportWrite(value, super._count, () {
      super._count = value;
    });
  }

  late final _$_CounterMobxActionController =
      ActionController(name: '_CounterMobx', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_CounterMobxActionController.startAction(
        name: '_CounterMobx.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CounterMobxActionController.startAction(
        name: '_CounterMobx.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CounterMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
