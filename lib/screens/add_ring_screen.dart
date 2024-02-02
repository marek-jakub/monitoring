import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../data/monitoring_db.dart';
import '../data/data_for_autocomplete/autocomplete_data.dart';
import '../data/data_for_autocomplete/data_validation/data_validation.dart';
import '../data/data_for_autocomplete/data_validation/ring_validation.dart';
import '../models/models.dart';

import '../widgets/custom_widgets.dart';

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

  // Form field focus nodes
  final FocusNode _ringSeriesNode = FocusNode();
  final FocusNode _idNumberNode = FocusNode();
  final FocusNode _wingLengthNode = FocusNode();
  final FocusNode _thirdPrimaryNode = FocusNode();
  final FocusNode _massNode = FocusNode();
  final FocusNode _billLengthNode = FocusNode();
  final FocusNode _hindClawNode = FocusNode();
  final FocusNode _totalHeadLengthNode = FocusNode();
  final FocusNode _tarsusNode = FocusNode();
  final FocusNode _tailLengthNode = FocusNode();
  final FocusNode _tailDifferenceNode = FocusNode();
  final FocusNode _fatScoreNode = FocusNode();
  final FocusNode _pectoralMuscleNode = FocusNode();
  final FocusNode _primaryScoreNode = FocusNode();
  final FocusNode _broodPatchNode = FocusNode();
  final FocusNode _primaryMoultNode = FocusNode();
  final FocusNode _oldGreaterCovertsNode = FocusNode();
  final FocusNode _alulaNode = FocusNode();
  final FocusNode _otherMarksNode = FocusNode();

  /// Current time.
  TimeOfDay? _currTime;

  /// Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  /// Form field input validator.
  late InputValidator _inputValidator;

  /// Ring input validator.
  late RingValidator _ringValidator;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    _dataManager.addListener(addRingListener);

    _inputValidator = InputValidator();
    _ringValidator = RingValidator();
  }

  @override
  void dispose() {
    // Dispose off controllers
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

    // Dispose off focus nodes
    _ringSeriesNode.dispose();
    _idNumberNode.dispose();
    _wingLengthNode.dispose();
    _thirdPrimaryNode.dispose();
    _massNode.dispose();
    _billLengthNode.dispose();
    _hindClawNode.dispose();
    _totalHeadLengthNode.dispose();
    _tarsusNode.dispose();
    _tailLengthNode.dispose();
    _tailDifferenceNode.dispose();
    _fatScoreNode.dispose();
    _pectoralMuscleNode.dispose();
    _primaryScoreNode.dispose();
    _broodPatchNode.dispose();
    _primaryMoultNode.dispose();
    _oldGreaterCovertsNode.dispose();
    _alulaNode.dispose();
    _otherMarksNode.dispose();

    _dataManager.removeListener(addRingListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MonitoRing: ring',
        ),
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            int currentSessionId =
                Provider.of<RingDataManager>(context, listen: false)
                    .currentSessionId;
            Provider.of<RingDataManager>(context, listen: false)
                .getSessionRingStream(currentSessionId);
            Provider.of<RingDataManager>(context, listen: false)
                .setNewRing(false);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                addRing();
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
                      validator: _ringValidator
                          .primaryIdMethodValidator(primaryIdMethod),
                    ),
                  ),
                  Expanded(
                    child: CustomDropdownButtonFormField(
                      controller: _metalRingInfoController,
                      txtLabel: 'Metal ring information',
                      listValues: metalRingInfo,
                      validator:
                          _ringValidator.metalRingInfoValidator(metalRingInfo),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: _ringSeriesCodeController,
                      focusNode: _ringSeriesNode,
                      txtLabel: 'Ring series',
                      keyboard: 'text',
                      // TODO: Implement proper validator.
                      validator: _inputValidator.placeholderValidator(),
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _ringIdNumberController,
                      focusNode: _idNumberNode,
                      txtLabel: 'ID number',
                      keyboard: 'number',
                      // TODO: Implement proper validator.
                      validator: _inputValidator.placeholderValidator(),
                    ),
                  ),
                ],
              ),
              CustomEasyAutocomplete(
                controller: _speciesController,
                txtLabel: 'Species',
                listValues: species,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: Column(
                  children: [
                    const Text(
                      'Sex',
                    ),
                    SexCheckboxFormField(
                      controller: _sexController,
                      validator: _ringValidator.sexCheckboxesValidator(),
                    ),
                  ],
                ),
              ),
              CustomDropdownButtonFormField(
                controller: _ageController,
                txtLabel: 'Age',
                listValues: age,
                validator: _ringValidator.ageValidator(age),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: ExpansionTile(
                  title: const Text(
                    'Body measurements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                                  focusNode: _wingLengthNode,
                                  txtLabel: 'Wing Length',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _thirdPrimaryController,
                                  focusNode: _thirdPrimaryNode,
                                  txtLabel: 'Third Primary',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _massController,
                                  focusNode: _massNode,
                                  txtLabel: 'Mass',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomDropdownButtonFormField(
                                  controller: _wingPointStateController,
                                  txtLabel: 'State of Wing Point',
                                  listValues: stateOfWingPoint,
                                  // TODO: implement proper validator
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomDropdownButtonFormField(
                                  controller: _moultController,
                                  txtLabel: 'Moult',
                                  listValues: moult,
                                  // TODO: implement proper validator
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomDropdownButtonFormField(
                                  controller: _plumageCodeController,
                                  txtLabel: 'Plumage code',
                                  listValues: plumageCode,
                                  // TODO: implement proper validator
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _billLengthController,
                                  focusNode: _billLengthNode,
                                  txtLabel: 'Bill Length',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _hindClawController,
                                  focusNode: _hindClawNode,
                                  txtLabel: 'Hind Claw',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _headLengthTotalController,
                                  focusNode: _totalHeadLengthNode,
                                  txtLabel: 'Total Head Length',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Bill Method',
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('C'),
                                        value: _billMethodController.text == 'C'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _billMethodController.text =
                                                value! ? 'C' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('F'),
                                        value: _billMethodController.text == 'F'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _billMethodController.text =
                                                value! ? 'F' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('N'),
                                        value: _billMethodController.text == 'N'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _billMethodController.text =
                                                value! ? 'N' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('S'),
                                        value: _billMethodController.text == 'S'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(
                                            () {
                                              _billMethodController.text =
                                                  value! ? 'S' : '';
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _tarsusController,
                                  focusNode: _tarsusNode,
                                  txtLabel: 'Tarsus',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _tailLengthController,
                                  focusNode: _tailLengthNode,
                                  txtLabel: 'Tail Length',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _tailDifferenceController,
                                  focusNode: _tailDifferenceNode,
                                  txtLabel: 'Tail Difference',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Tarsus Method',
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('M'),
                                        value:
                                            _tarsusMethodController.text == 'M'
                                                ? true
                                                : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _tarsusMethodController.text =
                                                value! ? 'M' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('S'),
                                        value:
                                            _tarsusMethodController.text == 'S'
                                                ? true
                                                : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _tarsusMethodController.text =
                                                value! ? 'S' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('T'),
                                        value:
                                            _tarsusMethodController.text == 'T'
                                                ? true
                                                : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _tarsusMethodController.text =
                                                value! ? 'T' : '';
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _fatScoreController,
                                  focusNode: _fatScoreNode,
                                  txtLabel: 'Fat Score',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _pectoralMuscleController,
                                  focusNode: _pectoralMuscleNode,
                                  txtLabel: 'Pectoral Muscle Score',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _primaryScoreController,
                                  focusNode: _primaryScoreNode,
                                  txtLabel: 'Primary Score',
                                  keyboard: 'number',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Fat Score Method',
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('B'),
                                        value: _fatScoreMethodController.text ==
                                                'B'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _fatScoreMethodController.text =
                                                value! ? 'B' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('E'),
                                        value: _fatScoreMethodController.text ==
                                                'E'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _fatScoreMethodController.text =
                                                value! ? 'E' : '';
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CheckboxListTile(
                                        title: const Text('P'),
                                        value: _fatScoreMethodController.text ==
                                                'P'
                                            ? true
                                            : false,
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _fatScoreMethodController.text =
                                                value! ? 'P' : '';
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _broodPatchController,
                                  focusNode: _broodPatchNode,
                                  txtLabel: 'Brood Patch',
                                  keyboard: 'text',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _primaryMoultController,
                                  focusNode: _primaryMoultNode,
                                  txtLabel: 'Primary Moult',
                                  keyboard: 'text',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: _oldGreaterCovertsController,
                                  focusNode: _oldGreaterCovertsNode,
                                  txtLabel: 'Old Greater Coverts',
                                  keyboard: 'text',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                // TODO: There are finite number of alula values,
                                // use a dropdown with a list holding the values.
                                child: CustomTextFormField(
                                  controller: _alulaController,
                                  focusNode: _alulaNode,
                                  txtLabel: 'Alula',
                                  keyboard: 'text',
                                  // TODO: Implement proper validator.
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                              Expanded(
                                child: CustomDropdownButtonFormField(
                                  controller: _carpalCovertController,
                                  txtLabel: 'Carpal covert',
                                  listValues: carpalCovert,
                                  // TODO: implement proper validator
                                  validator:
                                      _inputValidator.placeholderValidator(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: const Text(
                  'Circumstances',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Form(
                    key: _circumstancesFormKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _sexingMethodController,
                                txtLabel: 'Sexing method',
                                listValues: sexingMethod,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _catchingMethodController,
                                txtLabel: 'Catching method',
                                listValues: catchingMethod,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _catchingLuresController,
                                txtLabel: 'Catching lures',
                                listValues: catchingLures,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _conditionController,
                                txtLabel: 'Condition',
                                listValues: condition,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _statusController,
                                txtLabel: 'Status',
                                listValues: status,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _circumstancesController,
                                txtLabel: 'Circumstances',
                                listValues: circumstances,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _circumstancesPresumedController,
                                txtLabel: 'Circumstances presumed',
                                listValues: circumstancesPresumed,
                                // TODO: implement proper validator
                                validator:
                                    _inputValidator.placeholderValidator(),
                              ),
                            ),
                          ],
                        ),
                        CustomTimePickerField(
                          controller: _timeController,
                          txtLabel: 'Time',
                          callback: () {
                            pickTime(context);
                          },
                          // TODO: Implement proper validator.
                          validator: _inputValidator.placeholderValidator(),
                        ),
                        CustomTextFormField(
                          controller: _otherMarksController,
                          focusNode: _otherMarksNode,
                          txtLabel: 'Other marks',
                          keyboard: 'text',
                          // TODO: Implement proper validator.
                          validator: _inputValidator.placeholderValidator(),
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

  /// Saves ring data in the database.
  void addRing() {
    final isRequiredValid = _requiredDataFormKey.currentState?.validate();

    // final areBodyMeasurementsValid =
    //     _bodyMeasurementsFormKey.currentState?.validate();
    // final areCircumstancesValid =
    //     _circumstancesFormKey.currentState?.validate();

    // if ((isRequiredValid != null && isRequiredValid) &&
    //     (areBodyMeasurementsValid != null && areBodyMeasurementsValid) &&
    //     (areCircumstancesValid != null && areCircumstancesValid))

    if (isRequiredValid != null && isRequiredValid) {
      final ringEntity = RingEntityCompanion(
        sessionId: d.Value(context.read<RingDataManager>().currentSessionId),
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        primaryIdMethod: d.Value(_primaryIDMethodController.text),
        ringSeriesCode: d.Value(_ringSeriesCodeController.text),
        ringIdNumber: d.Value(_ringIdNumberController.text),
        metalRingInfo: d.Value(_metalRingInfoController.text),
        species: d.Value(_speciesController.text),
        age: d.Value(_ageController.text),
        sex: d.Value(_sexController.text),
        sexingMethod: d.Value(_sexingMethodController.text),
        otherMarks: d.Value(_otherMarksController.text),
        catchingMethod: d.Value(_catchingMethodController.text),
        catchingLures: d.Value(_catchingLuresController.text),
        condition: d.Value(_conditionController.text),
        circumstances: d.Value(_circumstancesController.text),
        circumstancesPresumed: d.Value(_circumstancesPresumedController.text),
        status: d.Value(_statusController.text),
        time: d.Value(_timeController.text),
        wingLength: d.Value(_wingLengthController.text),
        thirdPrimary: d.Value(_thirdPrimaryController.text),
        wingPointState: d.Value(_wingPointStateController.text),
        mass: d.Value(_massController.text),
        moult: d.Value(_moultController.text),
        plumageCode: d.Value(_plumageCodeController.text),
        hindClaw: d.Value(_hindClawController.text),
        billLength: d.Value(_billLengthController.text),
        billMethod: d.Value(_billMethodController.text),
        headLengthTotal: d.Value(_headLengthTotalController.text),
        tarsus: d.Value(_tarsusController.text),
        tarsusMethod: d.Value(_tarsusMethodController.text),
        tailLength: d.Value(_tailLengthController.text),
        tailDifference: d.Value(_tailDifferenceController.text),
        fatScore: d.Value(_fatScoreController.text),
        fatScoreMethod: d.Value(_fatScoreMethodController.text),
        pectoralMuscle: d.Value(_pectoralMuscleController.text),
        broodPatch: d.Value(_broodPatchController.text),
        primaryScore: d.Value(_primaryScoreController.text),
        primaryMoult: d.Value(_primaryMoultController.text),
        oldGreaterCoverts: d.Value(_oldGreaterCovertsController.text),
        alula: d.Value(_alulaController.text),
        carpalCovert: d.Value(_carpalCovertController.text),
      );

      context.read<RingDataManager>().saveRing(ringEntity);
    }
  }

  /// Change notifier listener, reacts to ring data saving action.
  void addRingListener() {
    if (_dataManager.isRingAdded) {
      listenRingAdd();
      _dataManager.setIsRingAdded(false);
      // Clear data fields to allow another entry input.
      setState(
        () {
          _primaryIDMethodController.clear();
          _ringSeriesCodeController.clear();
          _ringIdNumberController.clear();
          _metalRingInfoController.clear();
          _speciesController.clear();
          _ageController.clear();
          _sexController.clear();
          _sexingMethodController.clear();
          _catchingMethodController.clear();
          _catchingLuresController.clear();
          _conditionController.clear();
          _statusController.clear();
          _timeController.clear();
          _circumstancesController.clear();
          _circumstancesPresumedController.clear();
          _otherMarksController.clear();
          _wingLengthController.clear();
          _thirdPrimaryController.clear();
          _wingPointStateController.clear();
          _massController.clear();
          _moultController.clear();
          _plumageCodeController.clear();
          _hindClawController.clear();
          _billLengthController.clear();
          _billMethodController.clear();
          _headLengthTotalController.clear();
          _tarsusController.clear();
          _tarsusMethodController.clear();
          _tailLengthController.clear();
          _tailDifferenceController.clear();
          _fatScoreController.clear();
          _fatScoreMethodController.clear();
          _pectoralMuscleController.clear();
          _broodPatchController.clear();
          _primaryScoreController.clear();
          _primaryMoultController.clear();
          _oldGreaterCovertsController.clear();
          _alulaController.clear();
          _carpalCovertController.clear();
        },
      );
    }

    if (_dataManager.error != '') {
      listenRingError(_dataManager.error);
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
      _timeController.text = time;
    });
  }
}
