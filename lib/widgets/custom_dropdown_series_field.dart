import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitoring/models/models.dart';

/// A dropdown button form field, requires text controler [_controller],
/// a label [_label] and a list of strings to be used [_listValues].
class CustomDropdownRingSeriesField extends StatefulWidget {
  const CustomDropdownRingSeriesField({
    Key? key,
    required TextEditingController schemeCodeController,
    required TextEditingController ringSeriesController,
    required TextEditingController ringIdController,
    required String txtLabel,
    required List<String> listValues,
  })  : _schemeCodeController = schemeCodeController,
        _ringSeriesController = ringSeriesController,
        _ringIdController = ringIdController,
        _label = txtLabel,
        _listValues = listValues,
        super(key: key);

  final TextEditingController _schemeCodeController;
  final TextEditingController _ringSeriesController;
  final TextEditingController _ringIdController;
  final String _label;
  final List<String> _listValues;

  @override
  State<CustomDropdownRingSeriesField> createState() =>
      _CustomDropdownRingSeriesFieldState();
}

class _CustomDropdownRingSeriesFieldState
    extends State<CustomDropdownRingSeriesField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
          icon: const Icon(Icons.arrow_downward),
          value: widget._ringSeriesController.text,
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
              widget._ringSeriesController.text = value!;
              widget._ringIdController.text = '';
              // Provider.of<RingDataManager>(context, listen: false)
              //     .getSeriesRings(
              //         context.read<ProfileManager>().getRinger.ringerId,
              //         widget._schemeCodeController.text,
              //         value);
              Provider.of<RingDataManager>(context, listen: false)
                  .getUnusedSeriesRings(
                      context.read<ProfileManager>().getRinger.ringerId,
                      widget._schemeCodeController.text,
                      value);
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
