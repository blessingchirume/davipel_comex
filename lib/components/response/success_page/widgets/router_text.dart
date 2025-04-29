import 'package:davipel_comex/components/size_config.dart';
import 'package:flutter/material.dart';

class RouterText extends StatelessWidget {
  const RouterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight!/85.38, bottom: SizeConfig.screenHeight!/85.38),  /// 8.0-8.0
      child: Text("Successfully completed!", style: TextStyle(color: Colors.black54, fontSize: SizeConfig.screenHeight!/27.32)),   /// 25
    );
  }
}
