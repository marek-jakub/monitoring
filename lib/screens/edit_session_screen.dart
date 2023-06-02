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

/// Screen used to edit session-location information.
class EditSessionScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.editSessionPath,
      key: ValueKey(MonitoRingPages.editSessionPath),
      child: const EditSessionScreen(),
    );
  }

  const EditSessionScreen({super.key});

  @override
  State<EditSessionScreen> createState() => _EditSessionScreenState();
}

class _EditSessionScreenState extends State<EditSessionScreen> {
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
