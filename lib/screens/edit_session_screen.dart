import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
// Deprecated package.
//import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';

import '../data/monitoring_db.dart';
import '../data/data_for_autocomplete/autocomplete_data.dart' as lists;
import '../data/data_for_autocomplete/data_validation.dart';
import '../models/models.dart';

import '../widgets/custom_widgets.dart';

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
  final _editSessionFormKey = GlobalKey<FormState>();

  /// Focus to be able to distinguish between start and end time fields.
  bool _startTimeFieldFocus = false;

  /// Set session data once on entering the page, not on later manual changes.
  bool firstSet = true;

  // Session information controllers
  //  final TextEditingController _ringingSchemeController =
  //    TextEditingController();
  final TextEditingController _ringerId = TextEditingController();
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

  // Form field focus nodes
  final FocusNode _localityNode = FocusNode();
  final FocusNode _latNode = FocusNode();
  final FocusNode _lonNode = FocusNode();
  final FocusNode _localeInfoNode = FocusNode();

  // TODO: create a pathway for user to be able to assign another location
  // to the session.

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
    _ringerId.dispose();
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

    // Dispose off focus nodes
    _localityNode.dispose();
    _latNode.dispose();
    _lonNode.dispose();
    _localeInfoNode.dispose();

    // Remove session notifier listeners
    _dataManager.removeListener(providerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, ringDataManager, child) {
        countryPlaceCodes = lists.placeCodes[ringDataManager.country] ?? [''];
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'MonitoRing: edit session',
            ),
            leading: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .getSessionLocationViewStream();
                Provider.of<RingDataManager>(context, listen: false)
                    .setEditSession(false);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  editSession();
                },
                icon: const Icon(Icons.save),
              ),
              IconButton(
                onPressed: () {
                  deleteSession();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Selector<RingDataManager, SessionLocationViewData?>(
              selector: (context, notifier) => notifier.sessionLocationViewData,
              builder: (context, data, child) {
                if (firstSet) {
                  setSession(data);
                  firstSet = false;
                }
                return Form(
                  key: _editSessionFormKey,
                  child: Column(
                    children: [
                      CustomDropdownCountryFormField(
                          countryController: _countryController,
                          placeCodeController: _placeCodeController,
                          txtLabel: 'Country',
                          listValues: lists.countries),
                      CustomDropdownButtonFormField(
                        controller: _placeCodeController,
                        txtLabel: 'Place code',
                        listValues: countryPlaceCodes,
                        // TODO: implement proper validator
                        validator:
                            _inputValidator.placeCodeValidator(['sd', 'sd']),
                      ),
                      CustomTextFormField(
                        controller: _localityController,
                        focusNode: _localityNode,
                        txtLabel: 'Locality name',
                        keyboard: 'text',
                        // TODO: Implement proper validator.
                        validator: _inputValidator.localityNameValidator(),
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
                        listValues: lists.accuracyOfDate,
                        // TODO: implement proper validator
                        validator:
                            _inputValidator.placeCodeValidator(['sd', 'sd']),
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
                        child: const Text('Add current latitude and longitude'),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: _latController,
                              focusNode: _latNode,
                              txtLabel: 'Latitude',
                              keyboard: 'number',
                              // TODO: Implement proper validator.
                              validator:
                                  _inputValidator.localityNameValidator(),
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _lonController,
                              focusNode: _lonNode,
                              txtLabel: 'Longitude',
                              keyboard: 'number',
                              // TODO: Implement proper validator.
                              validator:
                                  _inputValidator.localityNameValidator(),
                            ),
                          ),
                        ],
                      ),
                      CustomDropdownButtonFormField(
                        controller: _coordAccuracyController,
                        txtLabel: 'Co-ordinates accuracy',
                        listValues: lists.accuracyOfCoordinates,
                        // TODO: implement proper validator
                        validator:
                            _inputValidator.placeCodeValidator(['sd', 'sd']),
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
                              validator: _inputValidator.startTimeValidator(),
                            ),
                          ),
                          Expanded(
                            child: CustomTimePickerField(
                              controller: _endTimeController,
                              txtLabel: 'End time',
                              callback: () {
                                pickTime(context);
                              },
                              // TODO: Implement proper validator.
                              validator: _inputValidator.startTimeValidator(),
                            ),
                          ),
                        ],
                      ),
                      CustomTextFormField(
                        controller: _localeInfoController,
                        focusNode: _localeInfoNode,
                        txtLabel: 'Locality information',
                        keyboard: 'text',
                        // TODO: Implement proper validator.
                        validator: _inputValidator.localityNameValidator(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  /// Updates ringing session information according to input in the form.
  void editSession() {
    final isValid = _editSessionFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final locationEntity = LocationEntityCompanion(
        id: d.Value(context.read<RingDataManager>().currentLocationId),
        country: d.Value(_countryController.text),
        locality: d.Value(_localityController.text),
        placeCode: d.Value(_placeCodeController.text),
        latitude: d.Value(_latController.text),
        longitude: d.Value(_lonController.text),
        coordinatesAccuracy: d.Value(_coordAccuracyController.text),
        localeInfo: d.Value(_localeInfoController.text),
      );

      context.read<RingDataManager>().updateLocation(locationEntity);

      // Currently, session update is trigerred on successfull location update.
      // Option should be offered to choose different location for the session.
      if (context.read<RingDataManager>().isLocationUpdated) {
        final sessionEntity = SessionEntityCompanion(
          id: d.Value(context.read<RingDataManager>().currentSessionId),
          date: d.Value(_dateController.text),
          dateAccuracy: d.Value(_accuracyOfDateController.text),
          location: d.Value(context.read<RingDataManager>().currentLocationId),
          ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
          startTime: d.Value(_startTimeController.text),
          endTime: d.Value(_endTimeController.text),
        );

        context.read<RingDataManager>().updateSession(sessionEntity);
      }
    }
  }

  /// Removes session information from the database.
  void deleteSession() {
    // TODO: add warning and implement deleting all rings in session
    context.read<RingDataManager>().deleteSession();
  }

  /// Listens to change notifier save session success or error.
  void providerListener() {
    if (_dataManager.isSessionUpdated) {
      listenEditSession();
      context.read<RingDataManager>().setIsSessionUpdated(false);
    }

    if (_dataManager.isSessionDeleted) {
      listenDeleteSession();
      _ringerId.clear();
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
      context.read<RingDataManager>().setIsSessionDeleted(false);
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

  /// Shows scaffold messenger on successfuly deleting session data.
  void listenDeleteSession() {
    //context.read<SessionManager>().setIsSessionCurrentlyDeleted(true);
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Session data deleted',
          style: TextStyle(color: Colors.white),
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

  /// Populates form fields with selected session information provided in
  /// [data].
  void setSession(SessionLocationViewData? data) {
    if (data != null) {
      _ringerId.text = data.ringerId;
      _countryController.text = data.locationCountry ?? '';
      _placeCodeController.text = data.locationPlaceCode ?? '';
      _localityController.text = data.locationLocality ?? '';
      _dateController.text = data.date;
      _accuracyOfDateController.text = data.dateAccuracy;
      _latController.text = data.locationLat ?? '';
      _lonController.text = data.locationLon ?? '';
      _coordAccuracyController.text = data.locationCoordAccuracy ?? '';
      _startTimeController.text = data.startTime;
      _endTimeController.text = data.endTime;
      _localeInfoController.text = data.locationInfo ?? '';
    }
  }
}
