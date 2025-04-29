
import 'package:davipel_comex/components/size_config.dart';
import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:flutter/material.dart';

class OkButton extends StatefulWidget {
  const OkButton({super.key});

  @override
  _OkButtonState createState() => _OkButtonState();
}

class _OkButtonState extends State<OkButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RoutingConstants.productListPage);
      },
      child: Container(
          width: SizeConfig.screenWidth! / 2,

          /// 200
          height: SizeConfig.screenHeight! / 12.42,

          /// 55
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(30)),
          child: Center(
              child: Text(
            "OK",
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.screenHeight! / 37.95),
          ))

          /// 18
          ),
    );
  }
}
