import 'package:flutter/material.dart';
import 'package:monitoring/data/data_for_autocomplete/autocomplete_data.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';

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
    // _dataManager.addListener(providerListener);
  }

  @override
  void dispose() {
    // Dispose off text controllers.
    _seriesCode.dispose();
    _schemeCode.dispose();
    _ringFrom.dispose();
    _ringTo.dispose();

    // Remove notifier listener.
    // _dataManager.removeListener(providerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, ringDataManager, child) {
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
                            onPressed: () {},
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
              Selector<RingDataManager, List<RingseriesEntityData>>(
                selector: (context, notifier) => notifier.ringSeriesStream,
                builder: (context, ringSeries, child) {
                  return ListView.builder(
                      itemCount: ringSeries.length,
                      itemBuilder: (context, index) {
                        final ringseries = ringSeries[index];
                      });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
