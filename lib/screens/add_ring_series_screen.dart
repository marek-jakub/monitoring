import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

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

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('ring_series_screen'),
        ],
      ),
    );
  }
}
