//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import 'signal_page.dart';
//  //   ///

class PushPage extends StatelessWidget {
  const PushPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Push navigated to this page\nNothing of relevance here\nPlease return to the previous page',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            Watch((context) => Text(global$.value)),
            const SizedBox(height: 10.0),
            // Watch((context) => Text(widget$.value)),  This gives an error! The variable is local and it is destroyed when the widget is destroyed!
          ],
        ),
      ),
    );
  }
}
