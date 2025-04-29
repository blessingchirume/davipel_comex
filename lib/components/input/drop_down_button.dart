import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String hintText;
  final Function(String?) onChange;
  final List<DropdownMenuItem<String>> items;
  const Dropdown({super.key, required this.items, required this.hintText, required this.onChange, required bool isVolume});

  @override
  // ignore: library_private_types_in_public_api
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      style: const TextStyle(fontSize: 18),
      alignment: AlignmentDirectional.centerStart,
      hint:  Text(widget.hintText),
      value: selectedValue,
      onChanged: widget.onChange,
      items: widget.items,
    );
  }

}
