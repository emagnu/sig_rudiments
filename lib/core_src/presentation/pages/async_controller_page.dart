//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
//  //   ///

final counterController = AsyncCounterSignalController();

class AsyncCounterSignalController {
  late final Signal<AsyncState<int>> counterSignal = signal(const AsyncData(0));

  Future<void> increment() async {
    int number = counterSignal.value.requireValue;
    // counterSignal.value = AsyncState.loading();
    counterSignal.value = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 1));
    number++;
    try {
      // counterSignal.value = AsyncState.data(number + 1);
      // counterSignal.value = AsyncState.data(number);
      // counterSignal.value = AsyncData(number);
      throw Exception('There is an Error');
    } catch (e, s) {
      counterSignal.value = AsyncError(e.toString(), s);
    }
  }

  void decrement() async {
    int number = counterSignal.value.requireValue;
    counterSignal.value = AsyncState.loading();
    await Future.delayed(const Duration(seconds: 1));
    // counterSignal.value = AsyncState.data(number - 1);
    number--;
    counterSignal.value = AsyncState.data(number);
  }
}

class AsyncControllerPage extends StatelessWidget {
  const AsyncControllerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = counterController.counterSignal.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Controller Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            switch (state) {
              AsyncData data => Text(data.requireValue.toString()),
              AsyncError error => Text('${error.error}'),
              AsyncLoading() => const CircularProgressIndicator(),
            },
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
