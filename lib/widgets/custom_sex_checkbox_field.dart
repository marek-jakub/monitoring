import 'package:flutter/material.dart';

class SexCheckboxFormField extends FormField<int> {
  SexCheckboxFormField({
    super.key,
    TextEditingController? controller,
    super.validator,
    bool sexSelected = false,
  }) : super(
          builder: (FormFieldState<int> state) {
            return Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text(
                      'F',
                    ),
                    value: controller?.text == 'F' ? true : false,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      controller?.text = value! ? 'F' : '';
                      sexSelected = value! ? true : false;
                      state.didChange(value ? 1 : 0);
                    },
                    tileColor: state.hasError ? Colors.red : null,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: const Text(
                      'M',
                    ),
                    value: controller?.text == 'M' ? true : false,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      controller?.text = value! ? 'M' : '';
                      sexSelected = value! ? true : false;
                      state.didChange(value ? 2 : 0);
                    },
                    tileColor: state.hasError ? Colors.red : null,
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: const Text(
                      'U',
                    ),
                    value: controller?.text == 'U' ? true : false,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      controller?.text = value! ? 'U' : '';
                      sexSelected = value! ? true : false;
                      state.didChange(value ? 3 : 0);
                    },
                    tileColor: state.hasError ? Colors.red : null,
                  ),
                ),
              ],
            );
          },
        );
}
