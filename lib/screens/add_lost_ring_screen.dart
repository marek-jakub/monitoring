import 'package:flutter/material.dart';
import 'package:monitoring/data/data_for_autocomplete/autocomplete_data.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../models/models.dart';
import '../data/data_for_autocomplete/data_validation/data_validation.dart';

import '../widgets/custom_widgets.dart';

/// A form to input and save lost ring information as a lost ring entity.
class LostRingsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.addLostRingPath,
      key: ValueKey(MonitoRingPages.addLostRingPath),
      child: const LostRingsScreen(),
    );
  }

  const LostRingsScreen({super.key});

  @override
  State<LostRingsScreen> createState() => _LostRingsScreenState();
}

class _LostRingsScreenState extends State<LostRingsScreen> {
  /// Form key for accessing and checking form attributes' state.
  final _lostRingFormKey = GlobalKey<FormState>();

  // Lost ring information controllers
  final TextEditingController _schemeCode = TextEditingController();
  final TextEditingController _ringSeriesCode = TextEditingController();
  final TextEditingController _ringId = TextEditingController();

  // Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  // Lost ring id
  int _lostRingId = -1;

  // Ring series for a given ringer
  List<String> ringSeriesCodes = [];

  // Ring series list for the dropdown field
  List<String> ringSeries = [];

  // Unused rings list for the dropdown field
  List<String> unusedRings = [];

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
    // Dispose off text controllers.
    _schemeCode.dispose();
    _ringSeriesCode.dispose();
    _ringId.dispose();

    // Remove notifier listener.
    _dataManager.removeListener(providerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, ringDataManager, child) {
        ringSeriesCodes = ringDataManager.ringerSeriesCodes;
        unusedRings = ringDataManager.unusedRingIds;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'MonitoRing: lost rings',
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setNewLostRing(false);
              },
            ),
          ),
          body: Column(
            children: <Widget>[
              Form(
                key: _lostRingFormKey,
                child: Column(
                  children: [
                    CustomDropdownButtonFormField(
                      controller: _schemeCode,
                      txtLabel: 'Scheme code',
                      listValues: ringingSchemes..sort(),
                      validator: _inputValidator.placeholderValidator(),
                    ),
                    CustomDropdownRingSeriesField(
                        schemeCodeController: _schemeCode,
                        ringSeriesController: _ringSeriesCode,
                        ringIdController: _ringId,
                        txtLabel: 'Ring series code',
                        listValues: ringSeriesCodes),
                    CustomDropdownRingField(
                        ringIdController: _ringId,
                        txtLabel: 'Ring ID',
                        listValues: unusedRings),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                          child: OutlinedButton(
                            onPressed: () {
                              addLostRing();
                              _dataManager.getLostRingsStream(context
                                  .read<ProfileManager>()
                                  .getRinger
                                  .ringerId);
                            },
                            child: const Text('Add'),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                          child: OutlinedButton(
                            onPressed: () {
                              if (_lostRingId != -1) {
                                deleteLostRing(_lostRingId);
                                _lostRingId = -1;
                              }
                            },
                            child: const Text('Remove'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Lost rings'),
              Expanded(
                child: Selector<RingDataManager, List<LostRingEntityData>>(
                  selector: (context, notifier) => notifier.lostRingsStream,
                  builder: (context, lostRings, child) {
                    return ListView.builder(
                      itemCount: lostRings.length,
                      itemBuilder: (context, index) {
                        final lostRing = lostRings[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _ringSeriesCode.text = lostRing.ringSeriesCode;
                              _ringId.text = lostRing.idNumber;

                              _lostRingId = lostRing.id;
                            });
                          },
                          child: Card(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Ring series code:',
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                        child: Text(lostRing.ringSeriesCode,
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Ring ID:',
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                        child: Text(lostRing.idNumber,
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Saves lost ring information in the database.
  void addLostRing() {
    /// Checks for input validity
    final isValid = _lostRingFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final lostRingEntity = LostRingEntityCompanion(
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        schemeCode: d.Value(_schemeCode.text),
        ringSeriesCode: d.Value(_ringSeriesCode.text),
        idNumber: d.Value(_ringId.text),
      );

      context.read<RingDataManager>().saveLostRing(lostRingEntity);
    }
  }

  /// Removes lost ring information from the database.
  void deleteLostRing(int id) {
    context.read<RingDataManager>().deleteLostRing(id);
  }

  /// Listens to change notifier save, delete, modify lost ring success or error.
  void providerListener() {
    if (_dataManager.isLostRingAdded) {
      listenAddLostRing();
      // Clear data to allow another entry input.
      setState(() {
        _ringSeriesCode.clear();
        _ringId.clear();
      });
      context.read<RingDataManager>().setIsLostRingAdded(false);
    }

    if (_dataManager.isLostRingDeleted) {
      listenDeleteLostRing();
      // Clear data to allow another entry input.
      setState(() {
        _ringSeriesCode.clear();
        _ringId.clear();
      });
      context.read<RingDataManager>().setIsLostRingDeleted(false);
    }

    if (_dataManager.error != '') {
      listenLostRingError(_dataManager.error);
      _dataManager.setError('');
    }
  }

  /// Shows scaffold messenger on successfuly saved lost ring data.
  void listenAddLostRing() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Lost ring data saved',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              context.read<RingDataManager>().setIsLostRingAdded(false);
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

  /// Shows scaffold messenger on successfuly deleted lost ring data.
  void listenDeleteLostRing() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Lost ring data deleted',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              context.read<RingDataManager>().setIsLostRingDeleted(false);
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

  /// Shows scaffold messenger with error on save or delete.
  void listenLostRingError(String errorMsg) {
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
