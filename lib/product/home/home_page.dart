import 'package:flutter/material.dart';
import 'package:state_managment/core/components/button.dart';
import 'package:state_managment/core/useState/mobx/mobx.dart';
import 'package:state_managment/core/useState/my/mystate.dart';
import 'package:state_managment/core/useState/provider/provider.dart';

//model view yazmakla uğraşmak istemedim.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenericButton<CounterMyState>(counter: CounterMyState()).button!,
              GenericButton<CounterProvider>(counter: CounterProvider()).button!,
              GenericButton<CounterMobx>(counter: CounterMobx()).button!,
            ],
          ),
        ),
      ),
    );
  }
}
