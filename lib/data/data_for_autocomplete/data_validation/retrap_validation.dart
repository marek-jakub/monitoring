/// The retrap form input data validator.
class RetrapValidator {
  // Primary ID method
  // String? Function(String?)? primaryIdMethodValidator(
  //     List<String> idMethodCodes) {
  //   return (String? primaryIdMethod) {
  //     if (primaryIdMethod == null || primaryIdMethod.isEmpty) {
  //       return 'Primary ID method should not be empty!';
  //     } else if (!idMethodCodes.contains(primaryIdMethod)) {
  //       return 'Unrecognized primary ID method!';
  //     }
  //     return null;
  //   };
  // }

  // Metal ring information
  // String? Function(String?)? metalRingInfoValidator(
  //     List<String> metalRingInfoCodes) {
  //   return (String? metalRingInfo) {
  //     if (metalRingInfo == null || metalRingInfo.isEmpty) {
  //       return 'Metal ring information should not be empty!';
  //     } else if (!metalRingInfoCodes.contains(metalRingInfo)) {
  //       return 'Unrecognized metal ring information!';
  //     }
  //     return null;
  //   };
  // }

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
  // String? Function(String?)? ageValidator(List<String> ageCodes) {
  //   return (String? age) {
  //     if (age == null || age.isEmpty) {
  //       return 'Age should not be empty!';
  //     } else if (!ageCodes.contains(age)) {
  //       return 'Unrecognized age value!';
  //     }
  //     return null;
  //   };
  // }
}
