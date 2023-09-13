import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
// Deprecated package.
//import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';

import '../data/monitoring_db.dart';
import '../data/data_for_autocomplete/autocomplete_data.dart';
import '../data/data_for_autocomplete/data_validation.dart';
import '../models/models.dart';

import '../widgets/custom_widgets.dart';

/// A form to create a ringing session.
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

  /// Focus to be able to distinguish between start and end time fields.
  bool _startTimeFieldFocus = false;

  // Session information controllers
  //  final TextEditingController _ringingSchemeController =
  //    TextEditingController();
  final TextEditingController _countryController = TextEditingController();
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

  /// List holding country place codes for chosen country.
  List<String> countryPlaceCodes = [];

  /// Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  /// Form field input validator.
  late InputValidator _inputValidator;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    _dataManager.addListener(providerListener);

    _inputValidator = InputValidator();
  }

  @override
  void dispose() {
    // Dispose off session controllers
    _countryController.dispose();
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

  @override
  Widget build(BuildContext contex) {
    return Consumer<RingDataManager>(
      builder: (context, ringDataManager, child) {
        countryPlaceCodes = placeCodes[ringDataManager.country] ?? [''];
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'MonitoRing: session',
            ),
            leading: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setNewSession(false);
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    addSession();
                  },
                  icon: const Icon(Icons.save)),
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _sessionFormKey,
              child: Column(
                children: [
                  CustomDropdownCountryFormField(
                    countryController: _countryController,
                    placeCodeController: _placeCodeController,
                    txtLabel: 'Country',
                    listValues: countries,
                  ),
                  CustomDropdownButtonFormField(
                    controller: _placeCodeController,
                    txtLabel: 'Place code',
                    listValues: countryPlaceCodes,
                    validator:
                        _inputValidator.placeCodeValidator(countryPlaceCodes),
                  ),
                  CustomTextFormField(
                    controller: _localityController,
                    txtLabel: 'Locality name',
                    keyboard: 'text',
                  ),
                  CustomDatePickerField(
                    controller: _dateController,
                    txtLabel: 'Date',
                    callback: () {
                      pickDate(context);
                    },
                  ),
                  CustomDropdownButtonFormField(
                    controller: _accuracyOfDateController,
                    txtLabel: 'Accuracy of date',
                    listValues: accuracyOfDate,
                    // TODO: implement proper validator
                    validator:
                        _inputValidator.placeCodeValidator(countryPlaceCodes),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      determineLatLon().then((value) {
                        LocationData? location = value;
                        setState(() {
                          _latController.text =
                              location?.latitude.toString() ?? '';
                          _lonController.text =
                              location?.longitude.toString() ?? '';
                        });
                      });
                    },
                    child: const Text('Current latitude and longitude'),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _latController,
                          txtLabel: 'Latitude',
                          keyboard: 'number',
                        ),
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          controller: _lonController,
                          txtLabel: 'Longitude',
                          keyboard: 'number',
                        ),
                      ),
                    ],
                  ),
                  CustomDropdownButtonFormField(
                    controller: _coordAccuracyController,
                    txtLabel: 'Co-ordinates accuracy',
                    listValues: accuracyOfCoordinates,
                    // TODO: implement proper validator
                    validator:
                        _inputValidator.placeCodeValidator(countryPlaceCodes),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTimePickerField(
                          controller: _startTimeController,
                          txtLabel: 'Start time',
                          callback: () {
                            _startTimeFieldFocus = true;
                            pickTime(context);
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTimePickerField(
                          controller: _endTimeController,
                          txtLabel: 'End time',
                          callback: () {
                            pickTime(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    controller: _localeInfoController,
                    txtLabel: 'Locality information',
                    keyboard: 'text',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Saves session information in the database.
  void addSession() {
    /// Checks for input validity.
    final isValid = _sessionFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final locationEntity = LocationEntityCompanion(
        // TODO: if different from the signed in ringer id, use that one.
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        locality: d.Value(_localityController.text),
        country: d.Value(_countryController.text),
        placeCode: d.Value(_placeCodeController.text),
        latitude: d.Value(_latController.text),
        longitude: d.Value(_lonController.text),
        coordinatesAccuracy: d.Value(_coordAccuracyController.text),
        localeInfo: d.Value(_localeInfoController.text),
      );

      final sessionEntity = SessionEntityCompanion(
        date: d.Value(_dateController.text),
        dateAccuracy: d.Value(_accuracyOfDateController.text),
        location: const d.Value(-1),
        // TODO: if different from the signed in ringer id, use that one.
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        startTime: d.Value(_startTimeController.text),
        endTime: d.Value(_endTimeController.text),
      );

      context
          .read<RingDataManager>()
          .saveSession(locationEntity, sessionEntity);
    }
  }

  /// Listens to change notifier save session success or error.
  void providerListener() {
    if (_dataManager.isSessionAdded) {
      listenAddSession();
      // Clear data to allow another entry input.
      setState(() {
        _countryController.clear();
        _placeCodeController.clear();
        _localityController.clear();
        _dateController.clear();
        _accuracyOfDateController.clear();
        _latController.clear();
        _lonController.clear();
        _coordAccuracyController.clear();
        _startTimeController.clear();
        _endTimeController.clear();
        _localeInfoController.clear();
      });
      context.read<RingDataManager>().setIsSessionAdded(false);
    }

    if (_dataManager.error != '') {
      listenAddSessionError(_dataManager.error);
      context.read<RingDataManager>().setError('');
    }
  }

  /// Shows scaffold messenger on successfuly saved session data.
  void listenAddSession() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Session data saved',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              context.read<RingDataManager>().setIsSessionAdded(false);
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
  void listenAddSessionError(String errorMsg) {
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

  /// A date picker widget.
  Future<void> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _currDate ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 99),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
          data: ThemeData().copyWith(
              colorScheme: const ColorScheme.light(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  onSurface: Colors.black),
              dialogBackgroundColor: Colors.white),
          child: child ?? const Text('')),
    );

    if (newDate == null) {
      return;
    }

    setState(() {
      _currDate = newDate;
      String date = DateFormat('dd-MM-yyyy').format(newDate);
      _dateController.text = date;
    });
  }

  /// A time picker widget.
  Future<void> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: _currTime ?? initialTime,
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.light(
              primary: Colors.green,
              onPrimary: Colors.white,
              onSurface: Colors.black),
          dialogBackgroundColor: Colors.white,
        ),
        child: child ?? const Text(''),
      ),
    );

    if (newTime == null) {
      return;
    }

    setState(() {
      _currTime = newTime;
      String time = _currTime!.format(context);
      if (_startTimeFieldFocus) {
        _startTimeController.text = time;
        _endTimeController.text = time;
        _startTimeFieldFocus = false;
      } else {
        _endTimeController.text = time;
      }
    });
  }

  /// Returns GPS position of the location.
  ///
  /// User geolocation permissions required, else shows permissions denied
  /// message.
  Future<LocationData?> determineLatLon() async {
    Location location = Location();
    LocationData locationData;

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();

    return locationData;
  }
}
