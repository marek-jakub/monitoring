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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MonitoRing: lost rings',
        ),
        leading: IconButton(
          icon: const BackButtonIcon(),
          onPressed: () {
            Provider.of<RingDataManager>(context, listen: false)
                .setNewLostRing(false);
          },
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('lost_rings_screen'),
        ],
      ),
    );
  }
}
