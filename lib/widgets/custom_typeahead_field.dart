import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

/// A type ahead form field, requires text controller [_controller],
/// a label [_label] and a list of strings to be used for suggestions
/// [_listValues].
class CustomTypeaheadFormfield extends StatefulWidget {
  const CustomTypeaheadFormfield({
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
  State<CustomTypeaheadFormfield> createState() =>
      _CustomTypeaheadFormfieldState();
}

class _CustomTypeaheadFormfieldState extends State<CustomTypeaheadFormfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TypeAheadFormField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: widget._controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(widget._label),
              fillColor: Colors.white,
              filled: true,
            ),
            style: const TextStyle(fontSize: 14)),
        suggestionsCallback: (pattern) {
          return widget._listValues
              .where((species) =>
                  species.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, itemData) {
          return ListTile(
            title: Text(itemData.toString()),
          );
        },
        transitionBuilder: (context, child, controller) {
          return child;
        },
        onSuggestionSelected: (suggestion) {
          widget._controller.text = suggestion.toString();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please, select a species!';
          }
          return null;
        },
        onSaved: (newValue) {
          widget._controller.text = newValue.toString();
        },
      ),
    );
  }
}
