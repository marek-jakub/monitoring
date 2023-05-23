import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

import '../navigation/monitoring_route_parser.dart';
import '../navigation/monitoring_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MonitoRing());
}

class MonitoRing extends StatefulWidget {
  const MonitoRing({super.key});

  @override
  State<MonitoRing> createState() => _MonitoRingState();
}

class _MonitoRingState extends State<MonitoRing> {
  final _appStateManager = MonitoRingStateManager();
  final _ringDataManager = RingDataManager();
  late MonitoRingRouter _monitoringRouter;
  final routerParser = MonitoRingRouteParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
