import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:monitoring/data/monitoring_db.dart';

/// A basic json convert and data output.
class ModelOutput {
  saveJsonAsFile(List<RingEntityData> ringData) async {
    String jsonRings = jsonEncode(ringData);

    File ringsFile = File(await _getFilePath());
    ringsFile.writeAsString(jsonRings);

    debugPrint(ringsFile.toString());
  }

  Future<String> _getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/jsonRings';

    return filePath;
  }
}
