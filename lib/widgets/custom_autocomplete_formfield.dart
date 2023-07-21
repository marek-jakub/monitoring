import 'package:flutter/material.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';

class CustomAutocompleteFormfield extends StatefulWidget {
  const CustomAutocompleteFormfield({
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
  State<CustomAutocompleteFormfield> createState() =>
      _CustomAutocompleteFormfieldState();
}

class _CustomAutocompleteFormfieldState
    extends State<CustomAutocompleteFormfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SimpleAutocompleteFormField(
        decoration: InputDecoration(
          labelText: widget._label,
          border: const OutlineInputBorder(),
        ),
        minSearchLength: 2,
        maxSuggestions: 5,
        //suggestionsHeight: 120.0,
        itemBuilder: (context, item) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item.toString()),
        ),
        onSearch: (search) async => widget._listValues
            .where((species) =>
                species.toLowerCase().startsWith(search.toLowerCase()))
            .toList(),
        itemFromString: (string) {
          final matches = widget._listValues.where(
              (species) => species.toLowerCase() == string.toLowerCase());
          return matches.isEmpty ? null : matches.first;
        },
        onChanged: (value) =>
            setState(() => widget._controller.text = value.toString()),
        onSaved: (newValue) =>
            setState(() => widget._controller.text = newValue.toString()),
        validator: (species) => species == null ? 'Invalid species' : null,
      ),
    );
  }
}
