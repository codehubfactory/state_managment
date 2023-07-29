import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/core/models/state/counter.dart';
import 'package:state_managment/core/useState/mobx/mobx.dart';
import 'package:state_managment/core/useState/my/mystate.dart';
import 'package:state_managment/core/useState/provider/provider.dart';

class GenericButton<T extends CounterBase> {
  final T counter;

  GenericButton({
    required this.counter,
  });

  Widget? get button {
    switch (counter.runtimeType) {
      case CounterMobx:
        return MobxButtons(
          counter: counter,
        );
      case CounterMyState:
        return MyStateButtons(counter: counter);
      case CounterProvider:
        return ProviderButtons(counter: counter);
    }
  }
}

class MyStateButtons extends StatelessWidget {
  const MyStateButtons({super.key, required this.counter});
  final CounterBase counter;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: counter.count,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => counter.increment(),
                child: Text(" + " +
                    (snapshot.data != null
                        ? snapshot.data.toString()
                        : 0.toString())),
              ),
              Text(snapshot.data != null
                  ? snapshot.data.toString()
                  : 0.toString()),
              ElevatedButton(
                onPressed: () => counter.decrement(),
                child: Text(" - " +
                    (snapshot.data != null
                        ? snapshot.data.toString()
                        : 0.toString())),
              )
            ],
          );
        });
  }
}

class ProviderButtons extends StatelessWidget {
  const ProviderButtons({super.key, required this.counter});
  final CounterBase counter;
  @override
  Widget build(BuildContext context) {
    // return Consumer<CounterProvider>(
    //   builder: (BuildContext context, CounterProvider value, Widget? child) {
    //   },
    // );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () =>
              Provider.of<CounterProvider>(context, listen: false).increment(),
          child:
              Text(" + " + (context.watch<CounterProvider>().count.toString())),
        ),
        Text(context.watch<CounterProvider>().count.toString()),
        ElevatedButton(
          onPressed: () =>
              Provider.of<CounterProvider>(context, listen: false).decrement(),
          child:
              Text(" - " + (context.watch<CounterProvider>().count.toString())),
        )
      ],
    );
  }
}

class MobxButtons extends StatelessWidget {
  MobxButtons({super.key, required this.counter});
  final CounterBase counter;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => counter.increment(),
          child: Observer(
            builder: (context) => Text(" + " + counter.count.toString()),
          ),
        ),
        Observer(
          builder: (context) => Text(counter.count.toString()),
        ),
        ElevatedButton(
          onPressed: () => counter.decrement(),
          child: Observer(
            builder: (context) => Text(" - " + counter.count.toString()),
          ),
        )
      ],
    );
  }
}

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key, required this.counter});
  final CounterBase counter;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => counter.increment(),
      child: Text(counter.count.toString()),
    );
  }
}

class DecrementButton extends StatelessWidget {
  const DecrementButton({super.key, required this.counter});
  final CounterBase counter;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => () => counter.increment(),
      child: Text(counter.count.toString()),
    );
  }
}
