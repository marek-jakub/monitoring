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
  /// Form key for accessing and checking form attributes' state.
  final _sessionFormKey = GlobalKey<FormState>();

  /// Focus to be able to distinguish between start and end time fields.
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

  /// Permission to access user's location services.
  late LocationPermission permission;

  /// User's geographical position.
  late Position position;

  /// Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    _dataManager.addListener(providerListener);
  }

  @override
  void dispose() {
    // Dispose off session controllers
    _ringerId.dispose();
    _placeCodeController.dispose();
    _localityController.dispose();
    _dateController.dispose();
    _accuracyOfDateController.dispose();
    _latController.dispose();
    _lonController.dispose();
    _coordAccuracyController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _localeInfoController.dispose();

    // Remove session notifier listeners
    _dataManager.removeListener(providerListener);

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }

  /// Listens to change notifier save session success or error.
  void providerListener() {
    if (_dataManager.isSessionAdded) {
      listenEditSession();
      // TODO: call set session edited
    }

    if (_dataManager.error != '') {
      listenEditSessionError(_dataManager.error);
      context.read<RingDataManager>().setError('');
    }
  }

  /// Shows scaffold messenger on successfuly saved session data.
  void listenEditSession() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Session data updated',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              // TODO: call session edited
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows scaffold messenger with error on saving error.
  void listenEditSessionError(String errorMsg) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(
          errorMsg,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
