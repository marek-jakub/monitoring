import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitoring/models/models.dart';

/// A dropdown button form field, requires text controler [_controller],
/// a label [_label] and a list of strings to be used [_listValues].
class CustomDropdownSessionField extends StatefulWidget {
  const CustomDropdownSessionField({
    Key? key,
    required TextEditingController sessionController,
    required String txtLabel,
    required List<String> listValues,
  })  : _sessionController = sessionController,
        _label = txtLabel,
        _listValues = listValues,
        super(key: key);

  final TextEditingController _sessionController;
  final String _label;
  final List<String> _listValues;

  @override
  State<CustomDropdownSessionField> createState() =>
      _CustomDropdownSessionFieldState();
}

class _CustomDropdownSessionFieldState
    extends State<CustomDropdownSessionField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
          icon: const Icon(Icons.arrow_downward),
          value: widget._sessionController.text,
          decoration: InputDecoration(
            // Filled changes the color of the field
            //filled: true,
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
              widget._sessionController.text = value!;
              Provider.of<RingDataManager>(context, listen: false)
                  .setCountry(value);
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
