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

/// A form for editing, deleting retrap data stored in the database.
class EditRetrapScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.editRetrapPath,
      key: ValueKey(MonitoRingPages.editRetrapPath),
      child: const EditRetrapScreen(),
    );
  }

  const EditRetrapScreen({super.key});

  @override
  State<EditRetrapScreen> createState() => _EditRetrapScreenState();
}

class _EditRetrapScreenState extends State<EditRetrapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
