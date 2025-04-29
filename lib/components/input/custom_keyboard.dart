import 'package:flutter/material.dart';

class CustomNumericKeyboard extends StatelessWidget {
  final Function(String) onKeyPress; // Callback for key presses
  final VoidCallback onDelete; // Callback for delete
  final VoidCallback onDone; // Callback for done

  const CustomNumericKeyboard({
    super.key,
    required this.onKeyPress,
    required this.onDelete,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      // color: Colors.grey[200], // Background color
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Numeric keys (0-9)
          for (int i = 1; i <= 9; i += 3)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int j = i; j < i + 3; j++)
                  _buildKey(j.toString()),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Additional keys: empty space, 0, delete
              // const Spacer(), // Empty space
              _buildKey("."),
              _buildKey("0"),
              _buildActionKey(Icons.check, onDone),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String label) {
    return GestureDetector(
      onTap: () => onKeyPress(label),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
