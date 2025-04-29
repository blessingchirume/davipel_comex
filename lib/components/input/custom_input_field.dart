import 'package:davipel_comex/constants/style_constants.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final Icon icon;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.isPassword,
      required this.isEmail,
      required this.controller,
      this.validator,
      required this.icon});

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
          validator: validator,
          controller: controller,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,

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
