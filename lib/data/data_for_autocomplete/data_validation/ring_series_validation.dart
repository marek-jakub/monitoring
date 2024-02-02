import 'package:flutter/material.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:monitoring/models/models.dart';
import 'package:provider/provider.dart';

/// The ring series form input data validator.
class RingSeriesValidator {
  // Scheme code
  String? Function(String?)? schemeCodeValidator(List<String> schemeCodes) {
    return (String? schemeCode) {
      if (!schemeCodes.contains(schemeCode)) {
        return 'Unrecognized scheme code!';
      }
      return null;
    };
  }

  // Series code
  String? Function(String?)? seriesCodeValidator(FocusNode focusNode) {
    // TODO: implement series code validator.
    return (String? seriesCode) {
      // if (seriesCode == null || seriesCode.isEmpty && !focusNode.hasFocus) {
      //   return 'Series code should not be empty!';
      // }
      return null;
    };
  }

  // Series from
  String? Function(String?)? seriesFromValidator(BuildContext context,
      String scheme, String code, String seriesTo, FocusNode focusNode) {
    RegExp intMatch = RegExp(r'^[1-9]\d*$');

    List<RingseriesEntityData> codeSeries = [];

    return (String? seriesFrom) {
      if (seriesFrom!.isNotEmpty &&
          intMatch.hasMatch(seriesFrom) &&
          intMatch.hasMatch(seriesTo)) {
        // Get all ringseries for given ringer and code
        Provider.of<RingDataManager>(context, listen: false).getSeriesRings(
            Provider.of<ProfileManager>(context, listen: false)
                .getRinger
                .ringerId,
            scheme,
            code,
            int.parse(seriesFrom),
            int.parse(seriesTo));

        codeSeries =
            Provider.of<RingDataManager>(context, listen: false).seriesRings;
      }
      if (seriesFrom.isNotEmpty &&
          !intMatch.hasMatch(seriesFrom) &&
          !focusNode.hasFocus) {
        return 'Incorrect format!';
      } else if (codeSeries.isNotEmpty && !focusNode.hasFocus) {
        return 'Series numbers collide!';
      }
      return null;
    };
  }

  // Series to
  String? Function(String?)? seriesToValidator(BuildContext context,
      String scheme, String code, String seriesFrom, FocusNode focusNode) {
    RegExp intMatch = RegExp(r'^[1-9]\d*$');

    List<RingseriesEntityData> codeSeries = [];

    return (String? seriesTo) {
      if (seriesTo!.isNotEmpty &&
          intMatch.hasMatch(seriesTo) &&
          intMatch.hasMatch(seriesFrom)) {
        // Get all ringseries for given ringer and code
        Provider.of<RingDataManager>(context, listen: false).getSeriesRings(
            Provider.of<ProfileManager>(context, listen: false)
                .getRinger
                .ringerId,
            scheme,
            code,
            int.parse(seriesFrom),
            int.parse(seriesTo));

        codeSeries =
            Provider.of<RingDataManager>(context, listen: false).seriesRings;
      }
      if (seriesTo.isNotEmpty &&
          !intMatch.hasMatch(seriesTo) &&
          !focusNode.hasFocus) {
        return 'Incorrect format!';
      } else if (seriesTo.isNotEmpty &&
          !_isSeriesToGreater(seriesFrom, seriesTo) &&
          !focusNode.hasFocus) {
        return 'Series to is too low!';
      } else if (codeSeries.isNotEmpty && !focusNode.hasFocus) {
        return 'Series numbers collide!';
      }
      return null;
    };
  }

  /// Compares two strings of digits.
  ///
  /// Returns true if [from] is greater than [to],
  /// else returns false.
  bool _isSeriesToGreater(String from, String to) {
    RegExp fromMatch = RegExp(r'^[1-9]\d*$');
    if (fromMatch.hasMatch(from)) {
      int? fromNumber = int.tryParse(from);
      int? toNumber = int.tryParse(to);
      if (fromNumber == null || toNumber == null) {
        return false;
      } else if (fromNumber < toNumber) {
        return true;
      }
    }
    return false;
  }
}
