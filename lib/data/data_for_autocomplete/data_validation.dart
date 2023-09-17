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
    return (String? accuracyOfDate) {
      if (accuracyOfDate == null || accuracyOfDate.isEmpty) {
        return 'Accuracy of date should not be empty';
      } else if (!accOfDateCodes.contains(accuracyOfDate)) {
        return 'Unrecognized accuracy of date';
      }
      return null;
    };
  }
}
