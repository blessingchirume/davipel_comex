import 'package:davipel_comex/components/buttons/custom_tab_button.dart';
import 'package:flutter/material.dart';

class NavigateToBackOfficeApp extends StatelessWidget {
  final Function() onTap;
  const NavigateToBackOfficeApp({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('This feature is not yet available on mobile app'),
        const SizedBox(height: 10,),
        CustomTabButton(
          text: "GO TO BACKOFFICE",
          onTap: onTap
        )
      ],
    );
  }
}
