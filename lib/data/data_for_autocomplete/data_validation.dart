/// A form input data validator.
class InputValidator {
  // SESSION form input validation

  // Custom drop down country form field validation in the
  // custom_dropdown_country_field.dart

  // Place code
  String? Function(String?)? placeCodeValidator(List<String> plCodes) {
    return (String? placeCode) {
      if (placeCode == null || placeCode.isEmpty) {
        return 'Place code should not be empty';
      } else if (!plCodes.contains(placeCode)) {
        return 'Unrecognized place code';
      }
      return null;
    };
  }

  // Locality name
  String? Function(String?)? localityNameValidator() {
    return (String? localityName) {
      if (localityName == null || localityName.isEmpty) {
        return 'Locality name should not be empty';
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
        return 'Accuracy of date should not be empty';
      } else if (!accOfDateCodes.contains(dateAcc)) {
        return 'Unrecognized accuracy of date';
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
        return 'Latitude should not be empty';
      } else if (!latMatch.hasMatch(lat)) {
        return 'Latitude incorrect format';
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
        return 'Longitude should not be empty';
      } else if (!lonMatch.hasMatch(lon)) {
        return 'Longitude incorrect format';
      }
      return null;
    };
  }

  // Coordinates accuracy
  String? Function(String?)? coordValidator(List<String> accOfCoordCodes) {
    return (String? coordAccuracy) {
      if (coordAccuracy == null || coordAccuracy.isEmpty) {
        return 'Coordinates accuracy should not be empty';
      } else if (!accOfCoordCodes.contains(coordAccuracy)) {
        return 'Unrecognized coordinates accuracy';
      }
      return null;
    };
  }

  // Time
  String? Function(String?)? startTimeValidator() {
    RegExp timeMatch = RegExp(
        r'^(((0?[1-9]|1[012])(:[0-5][0-9])?am)|((0?[0-9]|1[012])(:[0-5][0-9])?pm))\b');
    return (String? time) {
      if (time == null || time.isEmpty) {
        return 'Start time should not be empty';
      } else if (!timeMatch.hasMatch(time)) {
        return 'Start time incorrect format';
      }
      return null;
    };
  }
}
