import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Text('lost_rings_screen'),
        ],
      ),
    );
  }

  /// Listens to change notifier save, delete, modify lost ring success or error.
  void providerListener() {}
}
