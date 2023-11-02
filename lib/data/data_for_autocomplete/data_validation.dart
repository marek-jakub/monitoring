import 'package:flutter/material.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:monitoring/models/models.dart';
import 'package:provider/provider.dart';

/// A form input data validator.
class InputValidator {
  // SESSION form input validation

  // Custom drop down country form field validation in the
  // custom_dropdown_country_field.dart

  // Place code
  String? Function(String?)? placeCodeValidator(List<String> plCodes) {
    return (String? placeCode) {
      if (placeCode == null || placeCode.isEmpty) {
        return 'Place code should not be empty!';
      } else if (!plCodes.contains(placeCode)) {
        return 'Unrecognized place code!';
      }
      return null;
    };
  }

  // Locality name
  String? Function(String?)? localityNameValidator() {
    return (String? localityName) {
      if (localityName == null || localityName.isEmpty) {
        return 'Locality name should not be empty!';
      }
      return null;
    };
  }

  // Date field validation in the
  // custom_date_picker_field.dart

  // Accuracy of date
  String? Function(String?)? accOfDateValidator(List<String> accOfDateCodes) {
    return (String? dateAcc) {
      if (dateAcc == null || dateAcc.isEmpty) {
        return 'Accuracy of date should not be empty!';
      } else if (!accOfDateCodes.contains(dateAcc)) {
        return 'Unrecognized accuracy of date!';
      }
      return null;
    };
  }

  // Latitude
  String? Function(String?)? latValidator() {
    RegExp latMatch = RegExp(
        r'^(\+|-)?(?:90(?:(?:\.0{1,6})?)|(?:[0-9]|[1-8][0-9])(?:(?:\.[0-9]{1,6})?))$');
    return (String? lat) {
      if (lat == null || lat.isEmpty) {
        return 'Latitude should not be empty!';
      } else if (!latMatch.hasMatch(lat)) {
        return 'Latitude incorrect format!';
      }
      return null;
    };
  }

  // Longitude
  String? Function(String?)? lonValidator() {
    RegExp lonMatch = RegExp(
        r'^(\+|-)?(?:180(?:(?:\.0{1,6})?)|(?:[0-9]|[1-9][0-9]|1[0-7][0-9])(?:(?:\.[0-9]{1,6})?))$');
    return (String? lon) {
      if (lon == null || lon.isEmpty) {
        return 'Longitude should not be empty!';
      } else if (!lonMatch.hasMatch(lon)) {
        return 'Longitude incorrect format!';
      }
      return null;
    };
  }

  // Coordinates accuracy
  String? Function(String?)? coordValidator(List<String> accOfCoordCodes) {
    return (String? coordAccuracy) {
      if (coordAccuracy == null || coordAccuracy.isEmpty) {
        return 'Coordinates accuracy should not be empty!';
      } else if (!accOfCoordCodes.contains(coordAccuracy)) {
        return 'Unrecognized coordinates accuracy!';
      }
      return null;
    };
  }

  // Session start time
  String? Function(String?)? startTimeValidator() {
    RegExp timeMatch = RegExp(r'^([01]\d|2[0-3]):[0-5]\d$');
    return (String? time) {
      if (time == null || time.isEmpty) {
        return 'Time should not be empty!';
      } else if (!timeMatch.hasMatch(time)) {
        return 'Time incorrect format!';
      }
      return null;
    };
  }

  // Session end time
  String? Function(String?)? endTimeValidator(String startTime) {
    RegExp endTimeMatch = RegExp(r'^([01]\d|2[0-3]):[0-5]\d$');
    return (String? endTime) {
      if (endTime == null || endTime.isEmpty) {
        return 'Time should not be empty!';
      } else if (!endTimeMatch.hasMatch(endTime)) {
        return 'Time incorrect format!';
      } else if (_isNotAfterStart(startTime, endTime)) {
        return 'End time not after start!';
      }
      return null;
    };
  }

  // Locality information
  String? Function(String?)? localityInfoValidator() {
    return null;
  }

  // RING form input validation

  // Primary ID method
  String? Function(String?)? primaryIdMethodValidator(
      List<String> idMethodCodes) {
    return (String? primaryIdMethod) {
      if (primaryIdMethod == null || primaryIdMethod.isEmpty) {
        return 'Primary ID method should not be empty!';
      } else if (!idMethodCodes.contains(primaryIdMethod)) {
        return 'Unrecognized primary ID method!';
      }
      return null;
    };
  }

  // Metal ring information
  String? Function(String?)? metalRingInfoValidator(
      List<String> metalRingInfoCodes) {
    return (String? metalRingInfo) {
      if (metalRingInfo == null || metalRingInfo.isEmpty) {
        return 'Metal ring information should not be empty!';
      } else if (!metalRingInfoCodes.contains(metalRingInfo)) {
        return 'Unrecognized metal ring information!';
      }
      return null;
    };
  }

  // TODO: add ring screen - create ring series and ID number validators.

  // Species field validation in the
  // custom_easy_autocomplete.dart

  // Sex checkbox fields validator
  String? Function(int?)? sexCheckboxesValidator() {
    return (int? sexSelected) {
      if (![1, 2, 3].contains(sexSelected)) {
        // The color red is used now to show warning, instead of text.
        return 'Checkbox must be checked';
      }
      return null;
    };
  }

  // Age validator
  String? Function(String?)? ageValidator(List<String> ageCodes) {
    return (String? age) {
      if (age == null || age.isEmpty) {
        return 'Age should not be empty!';
      } else if (!ageCodes.contains(age)) {
        return 'Unrecognized age value!';
      }
      return null;
    };
  }

  // Add RING SERIES FORM input validation

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
    RegExp seriesFromMatch = RegExp(r'^[1-9]\d*$');

    // Get all ringseries for given ringer and code
    Provider.of<RingDataManager>(context, listen: false).getSeriesRings(
        Provider.of<ProfileManager>(context, listen: false).getRinger.ringerId,
        scheme,
        code);
    List<RingseriesEntityData> codeSeries =
        Provider.of<RingDataManager>(context, listen: false).seriesRings;

    return (String? seriesFrom) {
      if (seriesFrom!.isNotEmpty &&
          !seriesFromMatch.hasMatch(seriesFrom) &&
          !focusNode.hasFocus) {
        return 'Incorrect format!';
      } else if (_seriesNumbersCollide(codeSeries, seriesFrom, seriesTo) &&
          !focusNode.hasFocus) {
        return 'Series numbers collide!';
      }
      return null;
    };
  }

  // Series to
  String? Function(String?)? seriesToValidator(BuildContext context,
      String scheme, String code, String seriesFrom, FocusNode focusNode) {
    RegExp seriesToMatch = RegExp(r'^[1-9]\d*$');

    // Get all ringseries for given ringer and code
    Provider.of<RingDataManager>(context, listen: false).getSeriesRings(
        Provider.of<ProfileManager>(context, listen: false).getRinger.ringerId,
        scheme,
        code);
    List<RingseriesEntityData> codeSeries =
        Provider.of<RingDataManager>(context, listen: false).seriesRings;

    return (String? seriesTo) {
      if (seriesTo!.isNotEmpty &&
          !seriesToMatch.hasMatch(seriesTo) &&
          !focusNode.hasFocus) {
        return 'Incorrect format!';
      } else if (seriesTo.isNotEmpty &&
          !_isSeriesToGreater(seriesFrom, seriesTo) &&
          !focusNode.hasFocus) {
        return 'Series to is too low!';
      } else if (_seriesNumbersCollide(codeSeries, seriesFrom, seriesTo) &&
          !focusNode.hasFocus) {
        return 'Series numbers collide!';
      }
      return null;
    };
  }

  // Add LOST RING FORM input validation

  // Series code
  // TODO: implement series code validator.

  // Rind ID
  // TODO: implement ring ID validator.

  /// Compares session end time to session start time.
  ///
  /// Requires start [startTime] and end time [endTime].
  bool _isNotAfterStart(String startTime, String endTime) {
    RegExp startTimeMatch = RegExp(r'^([01]\d|2[0-3]):[0-5]\d$');
    if (startTimeMatch.hasMatch(startTime)) {
      // Use same dummy YYYY-MM-DD in parsing day times
      DateTime? sTime = DateTime.tryParse('2020-07-17 $startTime:00');
      DateTime? eTime = DateTime.tryParse('2020-07-17 $endTime:00');
      if (sTime == null || eTime == null) {
        return true;
      } else if (eTime.isBefore(sTime) || eTime.isAtSameMomentAs(sTime)) {
        return true;
      }
    }
    return false;
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

  /// Compares series number ranges.
  ///
  /// Returns true if series ranges collide,
  /// else returns false.
  bool _seriesNumbersCollide(
      List<RingseriesEntityData> codeSeries, String from, String to) {
    RegExp integerMatch = RegExp(r'^[1-9]\d*$');
    if (integerMatch.hasMatch(from) && integerMatch.hasMatch(to)) {
      int? f = int.tryParse(from);
      int? t = int.tryParse(to);
      var range1 = [f, t];
      for (var series in codeSeries) {
        var range2 = [series.ringfrom, series.ringto];

        // Compare two ranges
        if (range1[1]! < range2[0] || range1[0]! > range2[1]) {
          return false;
        } else if (range1[1]! == range2[0] ||
            range1[0]! == range2[1] ||
            (range1[1]! >= range2[0] && range1[0]! <= range2[1])) {
          return true;
        }
      }
    }
    return false;
  }
}
