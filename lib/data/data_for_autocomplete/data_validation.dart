import 'autocomplete_data.dart';

class InputValidator {
  // Session input validation

  // Place code
  String? Function(String) placeCodeValidator = (String placeCode) {
    if (placeCode.isEmpty) {
      return 'Place code should not be empty';
    } else if (!placeCodes.containsValue(placeCode)) {
      return 'Unrecognized place code';
    }
    return null;
  };
}
