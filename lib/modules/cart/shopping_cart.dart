
import 'package:davipel_comex/components/buttons/custom_buttom.dart';
import 'package:davipel_comex/components/navigation/app_bar.dart';
import 'package:davipel_comex/components/navigation/app_drawer.dart';
import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:davipel_comex/constants/style_constants.dart';
import 'package:davipel_comex/modules/cart/cart_item_widget.dart';
import 'package:davipel_comex/modules/payments/controller/payment_controller.dart';
import 'package:davipel_comex/providers/cart_provider.dart';
import 'package:davipel_comex/services/process_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';


class ShoppingCartWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ShoppingCartWidget({Key? key});
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      floatingActionButton: SpeedDial(
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Colors.grey,
        overlayOpacity: 0.8,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              label: "Add item",
              onTap: () => Navigator.pushNamed(
                  context, RoutingConstants.companyProducts)),
          // SpeedDialChild(
          //     label: "Clear cart",
          //     onTap: () =>
          //         Provider.of<CartProvider>(context, listen: false).clear()),
          SpeedDialChild(
            label: "Checkout",
            onTap: () {
              Navigator.pushNamed(context, RoutingConstants.payment);
            },
          ),
        ],
      ),
      appBar: const CustomAppBar(
        title: "Cart",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(children: [
          const Divider(height: 20,),
          CustomButton(
            // text: "Charge: ${cart.cartTotal.toStringAsFixed(2)}",
            text: "Charge: ${cart.total.toStringAsFixed(2)}",
            onTap: () async {
              if (Provider.of<CartProvider>(context, listen: false)
                  .cart
                  .items
                  .isEmpty) {
                ProcessNotificationService.error(
                    context, "The cart is empty please add items");
              } else {
                // Navigator.of(context)
                //     .pushNamed(RoutingConstants.payment);

                var payload = {
                  "customer": 490,
                  "ref": "string",
                  "currency": "USD",
                  "due_date": "2025-04-23",
                  "branch": 3,
                  "warehouse": "MIL-H01",
                  "items": [
                    {
                      "code": "S519",
                      "quantity": 5,
                      "price": 1,
                      "tax": "I0"
                    }
                  ]
                };

                Response response = await PaymentController().makePayment(payload);

                if(response.statusCode == 200){}
              }
            },
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(),
              ),
              child: ListView(
                  padding: const EdgeInsets.only(
                      top: 1.75 * defaultPadding, bottom: 2.8 * defaultPadding),
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: Provider.of<CartProvider>(context)
                          .cart
                          .items
                          .map(
                            (item) => CartItemWidget(
                              cartItem: item,
                              index: Provider.of<CartProvider>(context)
                                  .cart
                                  .items
                                  .indexOf(item),
                            ),
                          )
                          .toList(),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }

  void processOrder(BuildContext context) {
    // Provider.of<OrderProvider>(context, listen: false).add(
    //   OrderModel(
    //       orderNumber: Provider.of<OrderProvider>(context, listen: false)
    //           .generateOrderNum(),

    //       items: Provider.of<CartProvider>(context, listen: false).cart),
    // );
    // Provider.of<CartProvider>(context, listen: false).clear();
    // Navigator.of(context).pushNamed(RoutingConstants.orders);
  }
}
