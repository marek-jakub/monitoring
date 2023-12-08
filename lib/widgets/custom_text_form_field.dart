import 'package:flutter/material.dart';

/// A text form field.
///
/// Requires text controller [_controller], a label [_label],
/// a string signifying what keyboard to show [_keyboard],
/// and an input validator [_validator].
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required String txtLabel,
    required String keyboard,
    required String? Function(String?)? validator,
  })  : _controller = controller,
        _focusNode = focusNode,
        _label = txtLabel,
        _keyboard = keyboard,
        _validator = validator;

  final TextEditingController _controller;
  final FocusNode _focusNode;
  final String _label;
  final String _keyboard;
  final String? Function(String?)? _validator;

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
        focusNode: widget._focusNode,
        keyboardType: widget._keyboard == 'text'
            ? TextInputType.text
            : TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(widget._label),
        ),
        validator: widget._validator,
      ),
    );
  }
}
