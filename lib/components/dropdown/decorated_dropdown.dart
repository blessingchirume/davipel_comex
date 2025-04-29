import 'package:flutter/material.dart';

class DecoratedDropdownButton extends StatefulWidget {
  const DecoratedDropdownButton({super.key});

  @override
  _DecoratedDropdownButtonState createState() => _DecoratedDropdownButtonState();
}

class _DecoratedDropdownButtonState extends State<DecoratedDropdownButton> {
  String? _selectedValue;
  final List<String> _items = ['Apple', 'Banana', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        border: Border.all(
          color: Colors.blue, // Border color
          width: 2.0, // Border width
        ),
        color: Colors.white, // Background color
      ),
      child: DropdownButton<String>(
        value: _selectedValue,
        hint: const Text('Select a fruit'),
        isExpanded: true, // Expand to take up all available width
        icon: const Icon(Icons.arrow_drop_down, color: Colors.blue), // Custom dropdown icon
        iconSize: 30.0, // Icon size
        elevation: 16,
        style: const TextStyle(
          color: Colors.blue, // Text color for the dropdown items
          fontSize: 16.0, // Text size
        ),
        underline: const SizedBox(), // Remove the default underline
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
        },
        items: _items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}