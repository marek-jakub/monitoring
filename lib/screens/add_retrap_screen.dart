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
  /// Form key for accessing, checking required data.
  final _requiredDataFormKey = GlobalKey<FormState>();

  /// Form key for accessing, checking bird's body data values.
  final _bodyMeasurementsFormKey = GlobalKey<FormState>();

  /// Form key for accessing, checking circumstances information.
  final _circumstancesFormKey = GlobalKey<FormState>();

  // Required identification Data controllers
  final TextEditingController _ringSchemeController = TextEditingController();
  final TextEditingController _ringSeriesCodeController =
      TextEditingController();
  final TextEditingController _ringIdNumberController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();

  // Information not required - circumstances
  final TextEditingController _primaryIDMethodController =
      TextEditingController();
  final TextEditingController _metalRingInfoController =
      TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();

  final TextEditingController _sexingMethodController = TextEditingController();
  final TextEditingController _catchingMethodController =
      TextEditingController();
  final TextEditingController _catchingLuresController =
      TextEditingController();

  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _circumstancesController =
      TextEditingController();
  final TextEditingController _circumstancesPresumedController =
      TextEditingController();
  final TextEditingController _otherMarksController = TextEditingController();

  // Information not required - body measurements
  final TextEditingController _wingLengthController = TextEditingController();
  final TextEditingController _thirdPrimaryController = TextEditingController();
  final TextEditingController _wingPointStateController =
      TextEditingController();
  final TextEditingController _massController = TextEditingController();
  final TextEditingController _moultController = TextEditingController();
  final TextEditingController _plumageCodeController = TextEditingController();
  final TextEditingController _hindClawController = TextEditingController();
  final TextEditingController _billLengthController = TextEditingController();
  final TextEditingController _billMethodController = TextEditingController();
  final TextEditingController _headLengthTotalController =
      TextEditingController();
  final TextEditingController _tarsusController = TextEditingController();
  final TextEditingController _tarsusMethodController = TextEditingController();
  final TextEditingController _tailLengthController = TextEditingController();
  final TextEditingController _tailDifferenceController =
      TextEditingController();
  final TextEditingController _fatScoreController = TextEditingController();
  final TextEditingController _fatScoreMethodController =
      TextEditingController();
  final TextEditingController _pectoralMuscleController =
      TextEditingController();
  final TextEditingController _broodPatchController = TextEditingController();
  final TextEditingController _primaryScoreController = TextEditingController();
  final TextEditingController _primaryMoultController = TextEditingController();
  final TextEditingController _oldGreaterCovertsController =
      TextEditingController();
  final TextEditingController _alulaController = TextEditingController();
  final TextEditingController _carpalCovertController = TextEditingController();

  /// Current time.
  TimeOfDay? _currTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
