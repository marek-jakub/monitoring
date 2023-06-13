import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('report_screen'),
        ],
      ),
    );
  }
}
