/// A form input data validator.
class InputValidator {
  // SESSION form input validation
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
}
