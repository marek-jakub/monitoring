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
import '../widgets/custom_typeahead_field.dart';

/// A form to input and save bird information as a ring entity.
class AddRingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.addRingPath,
      key: ValueKey(MonitoRingPages.addRingPath),
      child: const AddRingScreen(),
    );
  }

  const AddRingScreen({super.key});

  @override
  State<AddRingScreen> createState() => _AddRingScreenState();
}

class _AddRingScreenState extends State<AddRingScreen> {
  /// Form key for accessing, checking required data.
  final _requiredDataFormKey = GlobalKey<FormState>();

  /// Form key for accessing, checking bird's body data values.
  final _bodyMeasurementsFormKey = GlobalKey<FormState>();

  /// Form key for accessing, checking circumstances information.
  final _circumstancesFormKey = GlobalKey<FormState>();

  // Required identification data controllers
  final TextEditingController _primaryIDMethodController =
      TextEditingController();
  final TextEditingController _ringSeriesCodeController =
      TextEditingController();
  final TextEditingController _ringIdNumberController = TextEditingController();
  final TextEditingController _metalRingInfoController =
      TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();

  // Information not required - circumstances
  final TextEditingController _sexingMethodController = TextEditingController();
  final TextEditingController _catchingMethodController =
      TextEditingController();
  final TextEditingController _catchingLuresController =
      TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
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

  /// Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    _dataManager.addListener(addRingListener);
  }

  @override
  void dispose() {
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

    _dataManager.removeListener(addRingListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MonitoRing: Ring',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Provider.of<RingDataManager>(context, listen: false)
                .setNewRing(false);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                //addRing();
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _requiredDataFormKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: CustomDropdownButtonFormField(
                      controller: _primaryIDMethodController,
                      txtLabel: 'Primary ID method',
                      listValues: primaryIdMethod,
                    ),
                  ),
                  Expanded(
                    child: CustomDropdownButtonFormField(
                      controller: _metalRingInfoController,
                      txtLabel: 'Metal ring information',
                      listValues: metalRingInfo,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _ringSeriesCodeController,
                      txtLabel: 'Ring series',
                      keyboard: 'text',
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _ringIdNumberController,
                      txtLabel: 'ID number',
                      keyboard: 'number',
                    ),
                  ),
                ],
              ),
              CustomTypeaheadFormfield(
                  controller: _speciesController,
                  txtLabel: 'Species',
                  listValues: species),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Sex',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text(
                                'F',
                              ),
                              value: _sexController.text == 'F' ? true : false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  _sexController.text = value! ? 'F' : '';
                                });
                              },
                            ),
                          ),
                          Expanded(
                              child: CheckboxListTile(
                            title: const Text(
                              'M',
                            ),
                            value: _sexController.text == 'M' ? true : false,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (bool? value) {
                              setState(() {
                                _sexController.text = value! ? 'M' : '';
                              });
                            },
                          )),
                          Expanded(
                            child: CheckboxListTile(
                              title: const Text(
                                'U',
                              ),
                              value: _sexController.text == 'U' ? true : false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool? value) {
                                setState(() {
                                  _sexController.text = value! ? 'U' : '';
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomDropdownButtonFormField(
                controller: _ageController,
                txtLabel: 'Age',
                listValues: age,
              ),
              ExpansionTile(
                title: const Text(
                  'Body measurements',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                collapsedBackgroundColor: Colors.grey[500],
                backgroundColor: Colors.grey[500],
                children: [
                  Form(
                    key: _bodyMeasurementsFormKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                controller: _wingLengthController,
                                txtLabel: 'Wing Length',
                                keyboard: 'number',
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: _thirdPrimaryController,
                                txtLabel: 'Third Primary',
                                keyboard: 'number',
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: _massController,
                                txtLabel: 'Mass',
                                keyboard: 'number',
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                controller: _billLengthController,
                                txtLabel: 'Bill Length',
                                keyboard: 'number',
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: _hindClawController,
                                txtLabel: 'Hind Claw',
                                keyboard: 'number',
                              ),
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                controller: _headLengthTotalController,
                                txtLabel: 'Total Head Length',
                                keyboard: 'number',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addRingListener() {
    if (_dataManager.isRingAdded) {
      //listenRingAdd();
      _dataManager.setIsRingAdded(false);
    }

    if (_dataManager.error != '') {
      //listenRingError(_sessionManager.error);
      _dataManager.setError('');
    }
  }

  /// Shows scaffold messenger on successfuly saved ring data.
  void listenRingAdd() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Ring data saved',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
              onPressed: () {
                _dataManager.setIsRingAdded(false);
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

  /// Shows scaffold messenger containing text in [errorMsg].
  void listenRingError(String errorMsg) {
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
