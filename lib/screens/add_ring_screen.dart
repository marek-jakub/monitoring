import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../data/monitoring_db.dart';
import '../data/data_for_autocomplete/autocomplete_data.dart';
import '../models/models.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_dropdown_form_field.dart';
import '../widgets/custom_date_picker_field.dart';
import '../widgets/custom_time_picker_field.dart';

/// A form to input and save bird information as a ring entity.
class AddRingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.addRingPath,
      key: ValueKey(MonitoRingPages.addRingPath),
      child: const AddRingScreen(),
    );
  }

  const AddRingScreen({super.key});

  @override
  State<AddRingScreen> createState() => _AddRingScreenState();
}

class _AddRingScreenState extends State<AddRingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
