import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/monitoring_db.dart';
import '../models/models.dart';

class RetrapsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.retrapsPath,
      key: ValueKey(MonitoRingPages.retrapsPath),
      child: const RetrapsScreen(),
    );
  }

  const RetrapsScreen({super.key});

  @override
  State<RetrapsScreen> createState() => _RetrapsScreenState();
}

class _RetrapsScreenState extends State<RetrapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                if (context.read<RingDataManager>().currentSessionId > -1) {
                  Provider.of<RingDataManager>(context, listen: false)
                      .setNewRetrap(true);
                } else {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      content: const Text(
                        'Session not selected',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.brown,
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
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
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(90, 25)),
              child: const Text('Retrap'),
            ),
          ],
        ),
      ],
    );
  }
}
