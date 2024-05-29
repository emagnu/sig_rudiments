//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
//  //   ///

final Signal<int> counterSignal = signal(0);
final computeCounterSignal = computed(
  () => counterSignal.value.isEven ? 'Par' : 'Impar',
);

class ComputedPage extends StatelessWidget {
  ComputedPage({super.key});

  final Signal<int> numberSignal = signal(0);

  @override
  Widget build(BuildContext context) {
    counterSignal.listen(context, () {
      final snackBar = SnackBar(
        content: Text(
            'counterSignal is: ${counterSignal.value} - ${computeCounterSignal.value}'),
      );
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(snackBar);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Computed Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter: ${counterSignal.value}'),
            // Watch(
            //   (context) => Text('Watched Counter: ${counterSignal.value}'),
            // ),
            // Text('Watched Counter: ${counterSignal.watch(context)}'),
            Text('Counter seed (through computed): $computeCounterSignal'),
            // Text('Counter seed (through computed): ${computeCounterSignal.watch(context)}'),
            const SizedBox(height: 10.0),
            Text('Number: ${numberSignal.value}'),
            // Watch(
            //   (context) => Text('Watched Number: ${numberSignal.value}'),
            // ),
            Text('Watched Counter: ${numberSignal.watch(context)}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterSignal.value++;
          numberSignal.value + 2;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
