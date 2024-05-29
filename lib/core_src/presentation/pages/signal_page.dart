//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import 'push_page.dart';
import 'replacement_page.dart';
//  //   ///

final Signal<String> global$ = signal('global\$: final Global signal');

class SignalPage extends StatelessWidget {
  SignalPage({super.key});

  final Signal<String> widget$ = signal('widget\$: final Widget signal');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signal Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // GLOBAL
            Text(global$.watch(context)),
            const SizedBox(height: 10.0),
            Watch(
              (context) {
                return Text(global$.value);
              },
            ),
            const SizedBox(height: 10.0),
            Watch((context) => Text(global$.value)),
            const SizedBox(height: 20.0),
            // WIDGET
            Text(widget$.watch(context)),
            const SizedBox(height: 10.0),
            Watch(
              (context) {
                return Text(widget$.value);
              },
            ),
            const SizedBox(height: 10.0),
            Watch((context) => Text(widget$.value)),
            const SizedBox(height: 10.0),
            //  BUTTON
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PushPage()));
              },
              child: const Text('Push Page'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                // MaterialPageRoute(builder: (context) => const ReplacementPage()));
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const ReplacementPage()),
                    (route) => false);
              },
              child: const Text('Replacement Page'),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
