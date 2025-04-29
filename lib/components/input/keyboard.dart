import 'package:flutter/material.dart';

import 'custom_keyboard.dart';

class NumericKeyboardExample extends StatefulWidget {
  const NumericKeyboardExample({super.key});

  @override
  _NumericKeyboardExampleState createState() => _NumericKeyboardExampleState();
}

class _NumericKeyboardExampleState extends State<NumericKeyboardExample> {
  String _input = "";

  void _onKeyPress(String value) {
    setState(() {
      _input += value;
    });
  }

  void _onDelete() {
    setState(() {
      if (_input.isNotEmpty) {
        _input = _input.substring(0, _input.length - 1);
      }
    });
  }

  void _onDone() {
    // Perform an action with the input (e.g., submit)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Input: $_input")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Numeric Keyboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    _input,
                    style:
                        const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                  child: _buildActionKey(Icons.backspace, _onDelete)),
            ],
          ),
          // Display input

          const SizedBox(height: 20),
          // Custom Numeric Keyboard
          CustomNumericKeyboard(
            onKeyPress: _onKeyPress,
            onDelete: _onDelete,
            onDone: _onDone,
          ),
        ],
      ),
    );
  }

  Widget _buildActionKey(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 60,
        height: 60,
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(8.0),
        //   border: Border.all(color: Colors.grey),
        // ),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
