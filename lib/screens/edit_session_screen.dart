import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../data/monitoring_db.dart';
import '../data/data_for_autocomplete/autocomplete_data.dart';
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
  final TextEditingController _country = TextEditingController();
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

  /// Permission to access user's location services.
  late LocationPermission permission;

  /// User's geographical position.
  late Position position;

  /// List holding country place codes for chosen country.
  List<String> countryPlaceCodes = [];

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
    _country.dispose();
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
    return Consumer<RingDataManager>(
      builder: (context, ringDataManager, child) {
        countryPlaceCodes = placeCodes[ringDataManager.country] ?? [''];
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
                      CustomTextFormField(
                        controller: _ringerId,
                        txtLabel: 'Ringer ID',
                        keyboard: 'text',
                      ),
                      CustomDropdownCountryFormField(
                          countryController: _country,
                          placeCodeController: _placeCodeController,
                          txtLabel: 'Country',
                          listValues: countries),
                      CustomDropdownButtonFormField(
                          controller: _placeCodeController,
                          txtLabel: 'Place code',
                          listValues: countryPlaceCodes),
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
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Future<Position> location = determineLatLon();
                          position = await location;

                          setState(() {
                            _latController.text = position.latitude.toString();
                            _lonController.text = position.longitude.toString();
                          });
                        },
                        child: const Text('Add current latitude and longitude'),
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
          // TODO: if input different from signed in ringer, used that one
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
  Future<Position> determineLatLon() async {
    serviceStatus = await Geolocator.isLocationServiceEnabled();
    if (!serviceStatus) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enable location services.')),
        );
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Location permissions have been denied.')),
          );
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Location permissions are permanently denied.')),
        );
      }
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  /// Populates form fields with selected session information provided in
  /// [data].
  void setSession(SessionLocationViewData? data) {
    if (data != null) {
      _ringerId.text = data.ringerId;
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
