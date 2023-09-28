import 'package:flutter/material.dart';

/// A time picker.
///
/// Requires a text controller [_controller], a label [_label],
/// a callback method [_callback], a validator [_validator].
class CustomTimePickerField extends StatefulWidget {
  const CustomTimePickerField({
    Key? key,
    required TextEditingController controller,
    required String txtLabel,
    required VoidCallback callback,
    required String? Function(String?)? validator,
  })  : _controller = controller,
        _label = txtLabel,
        _callback = callback,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final VoidCallback _callback;
  final String? Function(String?)? _validator;

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
        validator: widget._validator,
        onTap: widget._callback,
      ),
    );
  }
}
