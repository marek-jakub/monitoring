import 'package:flutter/material.dart';

/// A text form field, requires text controller [_controller],
/// a label [_label] and a string signifying what keyboard to show [_keyboard].
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      required TextEditingController controller,
      required String txtLabel,
      required String keyboard})
      : _controller = controller,
        _label = txtLabel,
        _keyboard = keyboard,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final String _keyboard;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        controller: widget._controller,
        keyboardType: widget._keyboard == 'text'
            ? TextInputType.text
            : TextInputType.number,
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
      ),
    );
  }
}
