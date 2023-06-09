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

  /// Change notifier access.
  late RingDataManager _dataManager;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    //_dataManager.addListener(updateRetrapListener);
  }

  @override
  void dispose() {
    _ringSchemeController.dispose();
    _primaryIDMethodController.dispose();
    _ringSeriesCodeController.dispose();
    _ringIdNumberController.dispose();
    _metalRingInfoController.dispose();
    _speciesController.dispose();
    _ageController.dispose();
    _sexController.dispose();

    _sexingMethodController.dispose();
    _catchingMethodController.dispose();
    _catchingLuresController.dispose();
    _conditionController.dispose();
    _statusController.dispose();
    _timeController.dispose();
    _circumstancesController.dispose();
    _circumstancesPresumedController.dispose();
    _otherMarksController.dispose();

    _wingLengthController.dispose();
    _thirdPrimaryController.dispose();
    _wingPointStateController.dispose();
    _massController.dispose();
    _moultController.dispose();
    _plumageCodeController.dispose();
    _hindClawController.dispose();
    _billLengthController.dispose();
    _billMethodController.dispose();
    _headLengthTotalController.dispose();
    _tarsusController.dispose();
    _tarsusMethodController.dispose();
    _tailLengthController.dispose();
    _tailDifferenceController.dispose();
    _fatScoreController.dispose();
    _fatScoreMethodController.dispose();
    _pectoralMuscleController.dispose();
    _broodPatchController.dispose();
    _primaryScoreController.dispose();
    _primaryMoultController.dispose();
    _oldGreaterCovertsController.dispose();
    _alulaController.dispose();
    _carpalCovertController.dispose();

    //_dataManager.removeListener(updateRetrapListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  /// Change notifier listener, reacts to retrap data saving action.
  void updateRetrapListener() {
    if (_dataManager.isRetrapUpdated) {
      listenRetrapUpdate();
      _dataManager.setIsRetrapUpdated(false);
    }

    if (_dataManager.error != '') {
      listenRetrapError(_dataManager.error);
      _dataManager.setError('');
    }
  }

  /// A scaffold messenger with text shown on successful retrap update.
  void listenRetrapUpdate() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Retrap data updated',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
              onPressed: () {
                _dataManager.setIsRetrapUpdated(false);
                //ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  /// A scaffold messenger with a [errorMsg] shown on retrap update error.
  void listenRetrapError(String errorMsg) {
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
                //ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
