import 'package:flutter/material.dart';

class CustomTimePickerField extends StatefulWidget {
  const CustomTimePickerField(
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
  State<CustomTimePickerField> createState() => _CustomTimePickerFieldState();
}

class _CustomTimePickerFieldState extends State<CustomTimePickerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget._controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(widget._label),
        ),
        style: const TextStyle(fontSize: 14),
        validator: (value) {
          // if (value == null || value.isEmpty) {
          //   return '${widget._label} cannot be empty!';
          // }
          return null;
        },
        onTap: widget._callback,
      ),
    );
  }
}
