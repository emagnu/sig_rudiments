//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'signal_page.dart';
//  Import FILES
//  //   ///

class ReplacementPage extends StatelessWidget {
  const ReplacementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Replacement page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Navigated here through replacement\nThe previous page has been destroied'),
            const SizedBox(height: 10.0),
            Watch((context) => Text(global$.value)),
            const SizedBox(height: 10.0),
            // Watch((context) => Text(widget$.value)),
          ],
        ),
      ),
    );
  }
}
