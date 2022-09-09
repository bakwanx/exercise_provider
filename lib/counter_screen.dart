import 'package:exercise_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CounterProvider>(
                builder: (context, counterProvider, child) {
                  return Text(
                    counterProvider.getCounter.toString(),
                    style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<CounterProvider>(
          builder: (context, counterProvider, child) {
            return FloatingActionButton(
              onPressed: () {
                counterProvider.increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
