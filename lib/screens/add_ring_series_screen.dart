import 'package:flutter/material.dart';
import 'package:monitoring/data/data_for_autocomplete/autocomplete_data.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../models/models.dart';

import '../widgets/custom_widgets.dart';

/// A form to input and save ring series information as a ringseries entity.
class AddRingSeriesScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.addRingSeriesPath,
      key: ValueKey(MonitoRingPages.addRingSeriesPath),
      child: const AddRingSeriesScreen(),
    );
  }

  const AddRingSeriesScreen({super.key});

  @override
  State<AddRingSeriesScreen> createState() => _AddRingSeriesScreenState();
}

class _AddRingSeriesScreenState extends State<AddRingSeriesScreen> {
  /// Form key for accessing and checking form attributes' state.
  final _ringSeriesFormKey = GlobalKey<FormState>();

  // Ring series information controllers
  final TextEditingController _seriesCode = TextEditingController();
  final TextEditingController _schemeCode = TextEditingController();
  final TextEditingController _ringFrom = TextEditingController();
  final TextEditingController _ringTo = TextEditingController();

  // Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  // Ring series id
  int _ringSeriesId = -1;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    _dataManager.addListener(providerListener);
  }

  @override
  void dispose() {
    // Dispose off text controllers.
    _seriesCode.dispose();
    _schemeCode.dispose();
    _ringFrom.dispose();
    _ringTo.dispose();

    // Remove notifier listener.
    _dataManager.removeListener(providerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, dataManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'MonitoRing: ring series',
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setNewRingSeries(false);
              },
            ),
          ),
          body: Column(
            children: [
              Form(
                key: _ringSeriesFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _seriesCode,
                      txtLabel: 'Series code',
                      keyboard: 'text',
                    ),
                    CustomDropdownButtonFormField(
                      controller: _schemeCode,
                      txtLabel: 'Scheme code',
                      listValues: ringingSchemes..sort(),
                    ),
                    CustomTextFormField(
                      controller: _ringFrom,
                      txtLabel: 'Series from',
                      keyboard: 'number',
                    ),
                    CustomTextFormField(
                      controller: _ringTo,
                      txtLabel: 'Series to',
                      keyboard: 'number',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                          child: ElevatedButton(
                            onPressed: () {
                              addRingSeries();
                              _dataManager.getRingSeriesStream(context
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
                          child: ElevatedButton(
                            onPressed: () {
                              if (_ringSeriesId != -1) {
                                deleteRingSeries(_ringSeriesId);
                                _ringSeriesId = -1;
                              }
                            },
                            child: const Text('Remove'),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                          child: ElevatedButton(
                            onPressed: () {
                              updateRingSeries();
                            },
                            child: const Text('Update'),
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
              const Text('Available ring series'),
              Expanded(
                child: Selector<RingDataManager, List<RingseriesEntityData>>(
                  selector: (context, notifier) => notifier.ringSeriesStream,
                  builder: (context, ringSeries, child) {
                    return ListView.builder(
                        itemCount: ringSeries.length,
                        itemBuilder: (context, index) {
                          final ringseries = ringSeries[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _seriesCode.text = ringseries.code;
                                _schemeCode.text = ringseries.schemeCode;
                                _ringFrom.text = ringseries.ringfrom.toString();
                                _ringTo.text = ringseries.ringto.toString();

                                _ringSeriesId = ringseries.id;
                              });
                            },
                            child: Card(
                              elevation: 0,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Ring series code:',
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                        child: Text(ringseries.code,
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Scheme code:',
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                        child: Text(ringseries.schemeCode,
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Series from:',
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                        child: Text(
                                            ringseries.ringfrom.toString(),
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text('Series to:',
                                            textAlign: TextAlign.left),
                                      ),
                                      Expanded(
                                        child: Text(
                                            ringseries.ringto.toString(),
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Saves ring series information in the database.
  void addRingSeries() {
    /// Checks for input validity
    final isValid = _ringSeriesFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final ringSeriesEntity = RingseriesEntityCompanion(
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        code: d.Value(_seriesCode.text),
        schemeCode: d.Value(_schemeCode.text),
        ringfrom: d.Value(int.parse(_ringFrom.text)),
        ringto: d.Value(int.parse(_ringTo.text)),
      );

      context.read<RingDataManager>().saveRingSeries(ringSeriesEntity);
    }
  }

  /// Removes ring series information from the database.
  void deleteRingSeries(int id) {
    context.read<RingDataManager>().deleteRingSeries(id);
  }

  /// Updated ring series information in the database.
  void updateRingSeries() {
    /// Checks for input validity
    final isValid = _ringSeriesFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final ringSeriesEntity = RingseriesEntityCompanion(
        id: d.Value(context.read<RingDataManager>().selectedRingSeriesId),
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        code: d.Value(_seriesCode.text),
        schemeCode: d.Value(_schemeCode.text),
        ringfrom: d.Value(int.parse(_ringFrom.text)),
        ringto: d.Value(int.parse(_ringTo.text)),
      );

      context.read<RingDataManager>().updateRingSeries(ringSeriesEntity);
    }
  }

  /// Listens to change notifier save session success or error.
  void providerListener() {
    if (_dataManager.isRingSeriesAdded) {
      listenAddRingSeries();
      // Clear data to allow another entry input.
      setState(() {
        _seriesCode.clear();
        _schemeCode.clear();
        _ringFrom.clear();
        _ringTo.clear();
      });
      context.read<RingDataManager>().setIsRingSeriesAdded(false);
    }

    if (_dataManager.isRingSeriesDeleted) {
      listenDeleteRingSeries();
      // Clear form data.
      setState(() {
        _seriesCode.clear();
        _schemeCode.clear();
        _ringFrom.clear();
        _ringTo.clear();
      });
      context.read<RingDataManager>().setIsRingSeriesDeleted(false);
    }

    if (_dataManager.error != '') {
      listenRingSeriesError(_dataManager.error);
      _dataManager.setError('');
    }
  }

  /// Shows scaffold messenger on successfuly saved ring series data.
  void listenAddRingSeries() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Ring series data saved',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
        actions: [
          TextButton(
            onPressed: () {
              context.read<RingDataManager>().setIsRingSeriesAdded(false);
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

  /// Shows scaffold messenger on successfuly deleting ring series data.
  void listenDeleteRingSeries() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text(
          'Ring series data deleted',
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

  /// Shows scaffold messenger with error on save error.
  void listenRingSeriesError(String errorMsg) {
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
