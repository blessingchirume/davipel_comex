import 'package:davipel_comex/constants/style_constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


class CustomNumericField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String labelText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Icon icon;
  final FormFieldValidator<String>? validator;
  const CustomNumericField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.onChanged,
      required this.controller,
      required this.icon, required this.isPassword, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: TextFormField(
          obscureText: isPassword,
          onChanged: onChanged,
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          validator: validator,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(defaultPadding / 2),
              hintText: hintText,
              labelText: labelText,
              focusColor: Theme.of(context).primaryColor,
              prefixIcon: icon,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
