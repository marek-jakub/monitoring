import 'package:flutter/material.dart';

/// A dropdown button form field, requires text controler [_controller],
/// a label [_label] and a list of strings to be used [_listValues].
class CustomDropdownCountryFormField extends StatefulWidget {
  const CustomDropdownCountryFormField({
    Key? key,
    required TextEditingController controller,
    required String txtLabel,
    required List<String> listValues,
  })  : _controller = controller,
        _label = txtLabel,
        _listValues = listValues,
        super(key: key);

  final TextEditingController _controller;
  final String _label;
  final List<String> _listValues;

  @override
  State<CustomDropdownCountryFormField> createState() =>
      _CustomDropdownCountryFormFieldState();
}

class _CustomDropdownCountryFormFieldState
    extends State<CustomDropdownCountryFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
          icon: const Icon(Icons.arrow_downward),
          value: widget._controller.text,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            // Filled changes the color of the field
            //filled: true,
            labelText: widget._label,
            labelStyle: const TextStyle(fontSize: 14),
            fillColor: Colors.white,
            filled: true,
          ),
          style: const TextStyle(fontSize: 14, color: Colors.black),
          validator: (value) {
            // if (value == null || value.isEmpty) {
            //   return '${widget._label} cannot be empty!';
            // }
            return null;
          },
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