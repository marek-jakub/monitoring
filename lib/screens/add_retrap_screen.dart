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

  /// Change notifier access.
  late RingDataManager _dataManager;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    //_dataManager.addListener(addRetrapListener);
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

    _dataManager.removeListener(addRetrapListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MonitoRing: Retrap',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            _dataManager.setNewRetrap(false);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                //addRetrap();
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
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
            Row(
              children: [
                Expanded(
                  child: CustomDropdownButtonFormField(
                    controller: _ringSchemeController,
                    txtLabel: 'Ringing scheme',
                    listValues: ringingSchemes,
                  ),
                ),
                Expanded(
                  child: CustomDropdownButtonFormField(
                    controller: _conditionController,
                    txtLabel: 'Condition',
                    listValues: condition,
                  ),
                ),
              ],
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
                      CustomTypeaheadFormfield(
                          controller: _speciesController,
                          txtLabel: 'Species',
                          listValues: species),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
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
                                      value: _sexController.text == 'F'
                                          ? true
                                          : false,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _sexController.text =
                                              value! ? 'F' : '';
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: CheckboxListTile(
                                    title: const Text(
                                      'M',
                                    ),
                                    value: _sexController.text == 'M'
                                        ? true
                                        : false,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
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
                                      value: _sexController.text == 'U'
                                          ? true
                                          : false,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _sexController.text =
                                              value! ? 'U' : '';
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
                            child: CustomDropdownButtonFormField(
                              controller: _wingPointStateController,
                              txtLabel: 'State of Wing Point',
                              listValues: stateOfWingPoint,
                            ),
                          ),
                          Expanded(
                            child: CustomDropdownButtonFormField(
                              controller: _moultController,
                              txtLabel: 'Moult',
                              listValues: moult,
                            ),
                          ),
                          Expanded(
                            child: CustomDropdownButtonFormField(
                              controller: _plumageCodeController,
                              txtLabel: 'Plumage code',
                              listValues: plumageCode,
                            ),
                          ),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Bill Method',
                                style: TextStyle(color: Colors.grey[600]),
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
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: _tarsusController,
                              txtLabel: 'Tarsus',
                              keyboard: 'number',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _tailLengthController,
                              txtLabel: 'Tail Length',
                              keyboard: 'number',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _tailDifferenceController,
                              txtLabel: 'Tail Difference',
                              keyboard: 'number',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Tarsus Method',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CheckboxListTile(
                                      title: const Text('M'),
                                      value: _tarsusMethodController.text == 'M'
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
                                      value: _tarsusMethodController.text == 'S'
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
                                      value: _tarsusMethodController.text == 'T'
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
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: _fatScoreController,
                              txtLabel: 'Fat Score',
                              keyboard: 'number',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _pectoralMuscleController,
                              txtLabel: 'Pectoral Muscle Score',
                              keyboard: 'number',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _primaryScoreController,
                              txtLabel: 'Primary Score',
                              keyboard: 'number',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Fat Score Method',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CheckboxListTile(
                                      title: const Text('B'),
                                      value:
                                          _fatScoreMethodController.text == 'B'
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
                                      value:
                                          _fatScoreMethodController.text == 'E'
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
                                      value:
                                          _fatScoreMethodController.text == 'P'
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
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: _broodPatchController,
                              txtLabel: 'Brood Patch',
                              keyboard: 'text',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _primaryMoultController,
                              txtLabel: 'Primary Moult',
                              keyboard: 'text',
                            ),
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _oldGreaterCovertsController,
                              txtLabel: 'Old Greater Coverts',
                              keyboard: 'text',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: _alulaController,
                              txtLabel: 'Alula',
                              keyboard: 'text',
                            ),
                          ),
                          Expanded(
                            child: CustomDropdownButtonFormField(
                              controller: _carpalCovertController,
                              txtLabel: 'Carpal covert',
                              listValues: carpalCovert,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Circumstances',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              collapsedBackgroundColor: Colors.grey[300],
              backgroundColor: Colors.grey[300],
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
                              ),
                            ),
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _catchingMethodController,
                                txtLabel: 'Catching method',
                                listValues: catchingMethod,
                              ),
                            ),
                            Expanded(
                              child: CustomDropdownButtonFormField(
                                controller: _catchingLuresController,
                                txtLabel: 'Catching lures',
                                listValues: catchingLures,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        )),
      ),
    );
  }

  /// Change notifier listener, reacts to retrap data saving action.
  void addRetrapListener() {
    if (_dataManager.isRetrapAdded) {
      listenRetrapAdd();
      _dataManager.setIsRetrapAdded(false);
    }

    if (_dataManager.error != '') {
      listenRetrapError(_dataManager.error);
      _dataManager.setError('');
    }
  }

  /// Shows scaffold messenger on successfuly saved retrap data.
  void listenRetrapAdd() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Retrap data saved',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
              onPressed: () {
                _dataManager.setIsRetrapAdded(false);
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

  /// A scaffold messenger showing [errorMsg] on retrap save erorr.
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
