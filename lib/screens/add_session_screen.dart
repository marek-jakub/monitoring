import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../data/monitoring_db.dart';
import '../models/models.dart';

class AddSessionScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.addSessionPath,
      key: ValueKey(MonitoRingPages.addSessionPath),
      child: const AddSessionScreen(),
    );
  }

  const AddSessionScreen({super.key});

  @override
  State<AddSessionScreen> createState() => _AddSessionScreenState();
}

class _AddSessionScreenState extends State<AddSessionScreen> {
  @override
  Widget build(BuildContext contex) {
    return Scaffold();
  }
}
