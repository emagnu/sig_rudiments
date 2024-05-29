//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import 'async_controller_page.dart';
import 'computed_page.dart';
import 'controller_page.dart';
import 'signal_page.dart';
//  //   ///

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignalPage()));
              },
              child: const Text('Signal Page'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ComputedPage()));
              },
              child: const Text('Computed Page'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ControllerPage()));
              },
              child: const Text('Controller Page'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AsyncControllerPage()));
              },
              child: const Text('Async Controller Page'),
            ),
          ],
        ),
      ),
    );
  }
}
