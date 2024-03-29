import 'package:flutter/material.dart';
// import 'package:monitoring/data/monitoring_db.dart';
// import 'package:provider/provider.dart';
// import 'package:monitoring/models/models.dart';

/// A dropdown button form field, requires text controler [_controller],
/// a label [_label] and a list of strings to be used [_listValues].
class CustomDropdownRingField extends StatefulWidget {
  const CustomDropdownRingField({
    super.key,
    required TextEditingController ringIdController,
    required String txtLabel,
    required List<String> listValues,
  })  : _ringIdController = ringIdController,
        _label = txtLabel,
        _listValues = listValues;

  final TextEditingController _ringIdController;
  final String _label;
  final List<String> _listValues;

  @override
  State<CustomDropdownRingField> createState() =>
      _CustomDropdownRingFieldState();
}

class _CustomDropdownRingFieldState extends State<CustomDropdownRingField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
          icon: const Icon(Icons.arrow_downward),
          value: widget._ringIdController.text,
          decoration: InputDecoration(
            labelText: widget._label,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget._label} cannot be empty!';
            }
            return null;
          },
          menuMaxHeight: 200.0,
          onChanged: (String? value) {
            setState(() {
              widget._ringIdController.text = value!;
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
