//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
//  //   ///

final Signal<int> counterSignal = Signal(0);
final counterController = CounterSignalController();

class CounterSignalController {
  void increment() {
    counterSignal.value++;
  }

  void decrement() {
    counterSignal.value--;
  }
}

class ControllerPage extends StatelessWidget {
  const ControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('The helloSignals variable is: ${counterSignal.value} '),
            Text(
                'The helloSignals variable is: ${counterSignal.watch(context)} '),
            ElevatedButton(
                onPressed: () => counterController.increment(),
                child: const Text('+ Increment')),
            ElevatedButton(
                onPressed: () => counterController.decrement(),
                child: const Text('- Decrement')),
          ],
        ),
      ),
    );
  }
}
