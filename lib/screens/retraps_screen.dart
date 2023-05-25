import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/monitoring_db.dart';
import '../models/models.dart';

class RetrapsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.retrapsPath,
      key: ValueKey(MonitoRingPages.retrapsPath),
      child: const RetrapsScreen(),
    );
  }

  const RetrapsScreen({super.key});

  @override
  State<RetrapsScreen> createState() => _RetrapsScreenState();
}

class _RetrapsScreenState extends State<RetrapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: build retraps GUI
        );
  }
}
