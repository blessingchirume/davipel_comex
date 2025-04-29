import 'package:flutter/material.dart';

class CustomTabButton extends StatelessWidget {
  final String text;
  final Color? txtColor;
  final Color? bgColor;
  final Color? shadowColor;
  final Function()? onTap;

  const CustomTabButton(
      {super.key,
      required this.text,
      this.txtColor,
      this.bgColor,
      this.shadowColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: onTap,
    //   child: PhysicalModel(
    //     color: Colors.grey.withOpacity(.4),
    //     elevation: 2,
    //     borderRadius: BorderRadius.circular(0),
    //     child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(0),
    //           color: bgColor ?? Theme.of(context).primaryColor,
    //         ),
    //         child: Container(
    //           margin: const EdgeInsets.all(14),
    //           alignment: Alignment.center,
    //           child: CustomText(
    //             text: text,
    //             color: txtColor ?? Colors.white,
    //             // size: 22,
    //             weight: FontWeight.normal,
    //           ),
    //         )),
    //   ),
    // );
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0XFFE8E9F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(width: 1.0, color: Theme.of(context).primaryColor),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
