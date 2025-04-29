import 'package:davipel_comex/components/custom_text.dart';
import 'package:davipel_comex/components/response/success_page/widgets/lottie_widget.dart';
import 'package:davipel_comex/components/response/success_page/widgets/ok_button.dart';
import 'package:davipel_comex/components/response/success_page/widgets/router_text.dart';
import 'package:davipel_comex/components/size_config.dart';
import 'package:flutter/material.dart';


class TransactionSuccessPage extends StatelessWidget {
  final double tenderedAmount;
  final double change;
  const TransactionSuccessPage({super.key, required this.tenderedAmount, required this.change});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const LottieWidget(),
        const RouterText(),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            const CustomText(text: "Tender Amount:", size: 20, color: Color(0XFFAAAAAA),),
            CustomText(text: tenderedAmount.toStringAsFixed(2), size: 20, color: const Color(0XFFAAAAAA),),

          ],),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const CustomText(text: "Change:", size: 20, color: Color(0XFFAAAAAA),),
              CustomText(text: change.toStringAsFixed(2), size: 20, color: const Color(0XFFAAAAAA),),

            ],),
        ),
        SizedBox(
          height: SizeConfig.screenHeight! / 68.3,
        ),
        const OkButton(),
      ]),
    );
  }
}
