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
                      listValues: ringingSchemes,
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
                            onPressed: () {},
                            child: const Text('Remove'),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                          child: ElevatedButton(
                            onPressed: () {},
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
                            onTap: () {},
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

  /// Listens to change notifier save session success or error.
  void providerListener() {
    if (_dataManager.isRingSeriesAdded) {
      listenAddRingSeries();
    }
  }

  /// Shows scaffold messenger on successfuly saved ring series data.
  void listenAddRingSeries() {}
}
