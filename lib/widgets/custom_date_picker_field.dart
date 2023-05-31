import 'package:flutter/material.dart';

class CustomDatePickerField extends StatelessWidget {
  const CustomDatePickerField(
      {Key? key,
      required TextEditingController controller,
      required String txtLabel,
      required VoidCallback callback})
      : _controller = controller,
        _label = txtLabel,
        _callback = callback,
        super(key: key);

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
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (value) {
          // if (value == null || value.isEmpty) {
          //   return '$_label cannot be empty!';
          // }
          return null;
        },
        onTap: _callback,
      ),
    );
  }
}
