import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:drift/drift.dart' as d;

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
  List<RetrapEntityData> retraps = [];
  List<ReportEntityData> reports = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, dataManager, child) {
        dataManager.fetchRingerRings(
            context.read<ProfileManager>().getRinger.ringerId);
        rings = dataManager.ringerRings;
        dataManager.fetchRingerRetraps(
            context.read<ProfileManager>().getRinger.ringerId);
        retraps = dataManager.ringerRetraps;
        reports = dataManager.reportStream;
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
                      outputData.saveDataAsFile(context, rings, retraps);
                      saveReportInfo(rings, retraps);
                      dataManager.getReportStream(
                          context.read<ProfileManager>().getRinger.ringerId);
                    },
                    child: const Text('Create report'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text('Reports'),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) {
                      final report = reports[index];
                      return Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text('Report date:',
                                      textAlign: TextAlign.left),
                                ),
                                Expanded(
                                  child: Text(report.date,
                                      textAlign: TextAlign.left),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text('Number of rings:',
                                      textAlign: TextAlign.left),
                                ),
                                Expanded(
                                  child: Text(report.numberOfRings.toString(),
                                      textAlign: TextAlign.left),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text('Number of retraps:',
                                      textAlign: TextAlign.left),
                                ),
                                Expanded(
                                  child: Text(report.numberOfRetraps.toString(),
                                      textAlign: TextAlign.left),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }

  void saveReportInfo(
      List<RingEntityData> rings, List<RetrapEntityData> retraps) {
    // Get current date to be used as report date input
    final initialDate = DateTime.now();
    String currentDate = DateFormat('dd-MM-yyyy').format(initialDate);

    final reportEntity = ReportEntityCompanion(
      ringerId: d.Value(context.read<ProfileManager>().getRinger.ringerId),
      date: d.Value(currentDate),
      numberOfRings: d.Value(rings.length),
      numberOfRetraps: d.Value(retraps.length),
      numberOfLostRings: const d.Value(0),
    );

    context.read<RingDataManager>().saveReport(reportEntity);
  }
}
