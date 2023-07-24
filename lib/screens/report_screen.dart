import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitoring/data/monitoring_db.dart';

import '../network/model_output.dart';
import '../models/models.dart';

/// A screen for data output as an EURING compatible .csv file.
class ReportScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.reportPath,
      key: ValueKey(MonitoRingPages.reportPath),
      child: const ReportScreen(),
    );
  }

  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  ModelOutput outputData = ModelOutput();
  List<RingEntityData> rings = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, dataManager, child) {
        dataManager.fetchAllRings();
        rings = dataManager.allRings;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'MonitoRing: report',
            ),
            leading: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setNewReport(false);
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      outputData.saveDataAsFile(context, rings);
                    },
                    child: const Text('Report'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
