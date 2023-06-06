import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../data/monitoring_db.dart';
import '../data/data_for_autocomplete/autocomplete_data.dart';
import '../models/models.dart';

import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_dropdown_form_field.dart';
import '../widgets/custom_time_picker_field.dart';
import '../widgets/custom_typeahead_field.dart';

/// A form to input and save recaptured bird information as a retrap entity.
class AddRetrapScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.addRetrapPath,
      key: ValueKey(MonitoRingPages.addRetrapPath),
      child: const AddRetrapScreen(),
    );
  }

  const AddRetrapScreen({super.key});

  @override
  State<AddRetrapScreen> createState() => _AddRetrapScreenState();
}

class _AddRetrapScreenState extends State<AddRetrapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
