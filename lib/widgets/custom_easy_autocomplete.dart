import 'package:flutter/material.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';

/// An autocomplete form field, requires text controller [_controller],
/// a label [_label] and a list of strings to be used for suggestions
/// [_listValues].
class CustomEasyAutocomplete extends StatefulWidget {
  const CustomEasyAutocomplete({
    super.key,
    required TextEditingController controller,
    required String txtLabel,
    required List<String> listValues,
  })  : _controller = controller,
        _label = txtLabel,
        _listValues = listValues;

  final TextEditingController _controller;
  final String _label;
  final List<String> _listValues;

  @override
  State<CustomEasyAutocomplete> createState() => _CustomEasyAutocompleteState();
}

class _CustomEasyAutocompleteState extends State<CustomEasyAutocomplete> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: EasyAutocomplete(
        decoration: InputDecoration(
          labelText: widget._label,
          labelStyle: const TextStyle(fontSize: 14),
          border: const OutlineInputBorder(),
        ),
        inputTextStyle: const TextStyle(fontSize: 14),
        // Cannot be initial value and controller set at the same time
        //initialValue: widget._controller.text,
        suggestions: widget._listValues,
        suggestionBuilder: (data) {
          return Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              data,
            ),
          );
        },
        controller: widget._controller,
        onChanged: (value) {
          setState(() {
            widget._controller.text = value;
          });
        },
        validator: (species) {
          if (species == null || species.isEmpty) {
            return 'Species should not be empty!';
          } else if (!widget._listValues.contains(species)) {
            return 'Unrecognized species information!';
          }
          return null;
        },
      ),
    );
  }
}
