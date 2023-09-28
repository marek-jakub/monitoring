import 'package:flutter/material.dart';

/// A dropdown button form field.
///
/// Requires text controler [_controller], a label [_label],
/// a list of strings to be used [_listValues] and
/// an input validator [_validator].
class CustomDropdownButtonFormField extends StatefulWidget {
  const CustomDropdownButtonFormField({
    Key? key,
    required TextEditingController controller,
    required String txtLabel,
    required List<String> listValues,
    required String? Function(String?)? validator,
  })  : _controller = controller,
        _label = txtLabel,
        _listValues = listValues,
        _validator = validator,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final List<String> _listValues;
  final String? Function(String?)? _validator;

  @override
  State<CustomDropdownButtonFormField> createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
          icon: const Icon(Icons.arrow_downward),
          value: widget._controller.text,
          decoration: InputDecoration(
            labelText: widget._label,
          ),
          validator: widget._validator,
          menuMaxHeight: 200.0,
          onChanged: (String? value) {
            setState(() {
              widget._controller.text = value!;
            });
          },
          items:
              widget._listValues.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    );
  }
}
