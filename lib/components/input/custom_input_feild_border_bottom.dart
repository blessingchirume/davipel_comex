import 'package:davipel_comex/constants/style_constants.dart';
import 'package:flutter/material.dart';


class CustomTextFieldBorderBottom extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Icon icon;
  const CustomTextFieldBorderBottom(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 8.0, left: defaultPadding, right: defaultPadding),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: const Border(
                bottom: BorderSide(width: 1, color: Color(0XFF8F8F8F)))),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) return 'Field Empty';
            return null;
          },
          controller: controller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(defaultPadding / 2),
              hintText: hintText,
              labelText: labelText,
              // focusColor: dFLightTheme().primaryColor,
              // prefixIcon: icon,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
