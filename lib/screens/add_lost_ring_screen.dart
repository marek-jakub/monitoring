import 'package:flutter/material.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../models/models.dart';

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

  // Ring series information controllers
  final TextEditingController _ringSeriesCode = TextEditingController();
  final TextEditingController _ringId = TextEditingController();

  // Provider and notifier access to data manager.
  late RingDataManager _dataManager;

  // Lost ring id
  int _lostRingId = -1;

  @override
  void initState() {
    super.initState();

    _dataManager = Provider.of<RingDataManager>(context, listen: false);
    _dataManager.addListener(providerListener);
  }

  @override
  void dispose() {
    // Dispose off text controllers.
    _ringSeriesCode.dispose();
    _ringId.dispose();

    // Remove notifier listener.
    _dataManager.removeListener(providerListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                CustomTextFormField(
                  controller: _ringSeriesCode,
                  txtLabel: 'Ring series code',
                  keyboard: 'text',
                ),
                CustomTextFormField(
                  controller: _ringId,
                  txtLabel: 'Ring ID',
                  keyboard: 'text',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                      child: ElevatedButton(
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
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_lostRingId != -1) {
                            deleteLostRing(_lostRingId);
                            _lostRingId = -1;
                          }
                        },
                        child: const Text('Remove'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          updateLostRing(_lostRingId);
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
                        setState(() {});
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
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Saves lost ring information in the database.
  void addLostRing() {
    /// Checks for input validity
    final isValid = _lostRingFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final lostRingEntity = LostRingEntityCompanion(
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
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

  /// Updated lost ring information in the database.
  void updateLostRing(int id) {
    /// Checks for input validity
    final isValid = _lostRingFormKey.currentState?.validate();

    if (isValid != null && isValid) {
      final lostRingEntity = LostRingEntityCompanion(
        id: d.Value(id),
        ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
        ringSeriesCode: d.Value(_ringSeriesCode.text),
        idNumber: d.Value(_ringId.text),
      );

      context.read<RingDataManager>().updateLostRing(lostRingEntity);
    }
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
  }

  /// Shows scaffold messenger on successfuly saved ring series data.
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
}
