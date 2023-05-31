import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:geolocator/geolocator.dart';

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
  /// Form key for accessing and checking form attributes' state.
  final _sessionFormKey = GlobalKey<FormState>();

  /// Focus to be able to distinguish between start and end time fields
  bool _startTimeFieldFocus = false;

  // Session information controllers
  //  final TextEditingController _ringingSchemeController =
  //    TextEditingController();
  final TextEditingController _ringerId = TextEditingController();
  final TextEditingController _placeCodeController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _accuracyOfDateController =
      TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lonController = TextEditingController();
  final TextEditingController _coordAccuracyController =
      TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _localeInfoController = TextEditingController();

  /// Current date.
  DateTime? _currDate;

  /// Current time.
  TimeOfDay? _currTime;

  /// A state of the GPS sensor service.
  bool serviceStatus = false;

  /// User permission to access GPS sensor service.
  bool hasPermission = false;

  /// Permission to access user's location services
  late LocationPermission permission;

  /// User's geographical position.
  late Position position;

  @override
  Widget build(BuildContext contex) {
    return Scaffold();
  }
}
