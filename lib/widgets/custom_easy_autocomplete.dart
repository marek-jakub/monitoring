import 'package:flutter/material.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';

class CustomEasyAutocomplete extends StatefulWidget {
  const CustomEasyAutocomplete({
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
        initialValue: widget._controller.text,
        suggestions: widget._listValues,
        suggestionBuilder: (data) {
          return Container(
            margin: const EdgeInsets.all(1),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              data,
              style: const TextStyle(color: Colors.black),
            ),
          );
        },
        onChanged: (value) => widget._controller.text = value,
        validator: (species) => species == null ? 'Invalid species' : null,
      ),
    );
  }
}
