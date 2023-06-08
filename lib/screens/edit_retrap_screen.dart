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
  /// Form key for accessing, checking required data.
  final _requiredDataFormKey = GlobalKey<FormState>();

  /// Form key for accessing, checking bird's body data values.
  final _bodyMeasurementsFormKey = GlobalKey<FormState>();

  /// Form key for accessing, checking circumstances information.
  final _circumstancesFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
