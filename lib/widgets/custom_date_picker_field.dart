import 'package:flutter/material.dart';

/// A date picker, requires a text controller [_controller],
/// a label [_label] and a callback method [_callback].
class CustomDatePickerField extends StatelessWidget {
  const CustomDatePickerField(
      {super.key,
      required TextEditingController controller,
      required String txtLabel,
      required VoidCallback callback})
      : _controller = controller,
        _label = txtLabel,
        _callback = callback;

  final TextEditingController _controller;
  final String _label;
  final VoidCallback _callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: _controller,
        //keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(_label),
        ),
        validator: (date) {
          RegExp dateMatch = RegExp(r'(\d{2}-\d{2}-\d{4})');
          if (date == null || date.isEmpty) {
            return 'Date field should not be empty!';
          } else if (!dateMatch.hasMatch(date)) {
            return 'Date should be in correct format!';
          }
          return null;
        },
        onTap: _callback,
      ),
    );
  }
}
