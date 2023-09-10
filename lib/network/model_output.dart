import 'dart:convert';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';

/// A basic json convert and data output.
class ModelOutput {
  saveDataAsFile(BuildContext context, List<RingEntityData> ringData,
      List<RetrapEntityData> retrapData) {
    String jsonRings = jsonEncode(ringData);
    String jsonRetraps = jsonEncode(retrapData);

    // Combination of rings and retraps
    String ringsAndRetraps = jsonRings + jsonRetraps;

    List<int> ringerOut = utf8.encode(ringsAndRetraps);
    Uint8List ringerOutput = Uint8List.fromList(ringerOut);

    // List<int> textRings = utf8.encode(jsonRings);
    // Uint8List textA = Uint8List.fromList(textRings);

    // List<int> textRetraps = utf8.encode(jsonRetraps);
    // Uint8List textB = Uint8List.fromList(textRetraps);

    // DocumentFileSavePlus might give 'missing plugin error'
    // when app run in linux.
    DocumentFileSavePlus fileSaver = DocumentFileSavePlus();

    fileSaver
        .saveFile(
      ringerOutput,
      "monitoRing.txt",
      "text/plain",
    )
        .then(
      (value) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: const Text(
              'Records saved in Download directory',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.brown,
            actions: [
              TextButton(
                onPressed: () {
                  //ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
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
      },
    );

    // fileSaver.saveMultipleFiles(
    //   dataList: [textA, textB],
    //   fileNameList: ["ringerRings.txt", "ringerRetraps.txt"],
    //   mimeTypeList: ["text/plain", "text/plain"],
    // ).then(
    //   (value) {
    //     ScaffoldMessenger.of(context).showMaterialBanner(
    //       MaterialBanner(
    //         content: const Text(
    //           'Records saved in Download directory',
    //           style: TextStyle(color: Colors.white),
    //         ),
    //         backgroundColor: Colors.brown,
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               //ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
    //               ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    //             },
    //             child: const Text(
    //               'Close',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  // saveJsonAsFile(List<RingEntityData> ringData) async {
  //   String jsonRings = jsonEncode(ringData);

  //   File ringsFile = File(await _getFilePath());
  //   ringsFile.writeAsString(jsonRings);

  //   debugPrint(ringsFile.toString());
  // }

  // Future<String> _getFilePath() async {
  //   Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  //   String appDocumentsPath = appDocumentsDirectory.path;
  //   String filePath = '$appDocumentsPath/jsonRings';

  //   return filePath;
  // }
}
