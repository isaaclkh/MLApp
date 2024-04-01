
import 'package:first/graph/pie_page.dart';
import 'package:flutter/material.dart';

import 'bar_page.dart';
import 'candle_page.dart';
import 'group_bar_page.dart';
import 'line_page.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const BarPage(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Bar'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const GroupBarPage(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Group bar'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const CandlePage(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Candle'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const LinePage(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Line'),
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const PiePage(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Pie'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}