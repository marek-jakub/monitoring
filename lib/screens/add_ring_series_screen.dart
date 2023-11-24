import 'package:flutter/material.dart';
import 'package:monitoring/data/data_for_autocomplete/autocomplete_data.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;
import 'package:flutter_slidable/flutter_slidable.dart';

import '../data/data_for_autocomplete/data_validation.dart';
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

  // Form field focus nodes
  FocusNode _sCode = FocusNode();
  FocusNode _sFrom = FocusNode();
  FocusNode _sTo = FocusNode();

  // Provider and notifier access to data manager.
  late RingDataManager _dataManager;

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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _ringSeriesFormKey,
                child: Column(
                  children: [
                    CustomDropdownButtonFormField(
                      controller: _schemeCode,
                      txtLabel: 'Scheme code',
                      listValues: ringingSchemes..sort(),
                      validator:
                          _inputValidator.schemeCodeValidator(ringingSchemes),
                    ),
                    CustomTextFormField(
                      controller: _seriesCode,
                      focusNode: _sCode,
                      txtLabel: 'Series code',
                      keyboard: 'text',
                      validator: _inputValidator.seriesCodeValidator(_sCode),
                    ),
                    CustomTextFormField(
                      controller: _ringFrom,
                      focusNode: _sFrom,
                      txtLabel: 'Series from',
                      keyboard: 'number',
                      validator: _inputValidator.seriesFromValidator(
                          context,
                          _schemeCode.text,
                          _seriesCode.text,
                          _ringTo.text,
                          _sFrom),
                    ),
                    CustomTextFormField(
                      controller: _ringTo,
                      focusNode: _sTo,
                      txtLabel: 'Series to',
                      keyboard: 'number',
                      validator: _inputValidator.seriesToValidator(
                          context,
                          _schemeCode.text,
                          _seriesCode.text,
                          _ringFrom.text,
                          _sTo),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 2.0, 2.0, 2.0),
                    child: ElevatedButton(
                      style: _formIsFilled()
                          ? const ButtonStyle()
                          : ButtonStyle(
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white54),
                            ),
                      onPressed: () {
                        if (_formIsFilled()) {
                          addRingSeries();
                          dataManager.getRingSeriesStream(context
                              .read<ProfileManager>()
                              .getRinger
                              .ringerId);
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ),
                ],
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
                        return Card(
                            child: Slidable(
                          key: const ValueKey(0),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  deleteRingSeries(ringseries.id);
                                },
                                // TODO: Update colors for bright and dark modes.
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Remove',
                              ),
                            ],
                          ),
                          child: Card(
                            elevation: 0,
                            child: Column(
                              children: [
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
                                      child: Text(ringseries.ringto.toString(),
                                          textAlign: TextAlign.left),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
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

      // Create and add in db rings from the series
      int? from = int.tryParse(_ringFrom.text);
      int? to = int.tryParse(_ringTo.text);

      context.read<RingDataManager>().saveRingsIn(
          context.read<ProfileManager>().getRinger.ringerId,
          _seriesCode.text,
          _schemeCode.text,
          from!,
          to!);

      // Check the ring has been added in, else cancel operation
      if (context.read<RingDataManager>().isRingInAdded) {
        context.read<RingDataManager>().setIsRingInAdded(false);
      } else {
        // Show error message
        showAddRingsInError(_dataManager.error);
      }

      // Check the last ring in has been added, if true save the series
      if (context.read<RingDataManager>().isRingInAdded) {
        context.read<RingDataManager>().saveRingSeries(ringSeriesEntity);
        context.read<RingDataManager>().setIsRingInAdded(false);
      }
      context.read<RingDataManager>().saveRingSeries(ringSeriesEntity);
    }
  }

  /// Removes ring series information from the database.
  void deleteRingSeries(int id) {
    context.read<RingDataManager>().deleteRingSeries(id);
  }

  /// Listens to change notifier save, delete, modify ring series success
  /// or error.
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
      // Clear form fields.
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

  /// Shows scaffold messenger with error on save, update or delete.
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

  /// Shows scaffold messenger with error on save, update or delete.
  void showAddRingsInError(String errorMsg) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(
          'Unable to add rings: $errorMsg',
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

  /// Return true on all form fields not being equal to ''.
  bool _formIsFilled() {
    return _schemeCode.text != '' &&
        _seriesCode.text != '' &&
        _ringFrom.text != '' &&
        _ringTo.text != '';
  }
}
