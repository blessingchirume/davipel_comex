// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:davipel_comex/components/custom_text.dart';
import 'package:davipel_comex/models/responses/cart_model.dart';
import 'package:davipel_comex/modules/cart/edit_cart_bottom_sheet.dart';
import 'package:davipel_comex/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartItemWidget extends StatefulWidget {
  final CartItemModel cartItem;
  final int index;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.index,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showFullScreenBottomSheet(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  // padding: const EdgeInsets.only(left: 14),
                  child: CustomText(
                    text: widget.cartItem.product.name.toString(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  // padding: const EdgeInsets.only(left: 14),
                  child: CustomText(
                    text: "${widget.cartItem.quantity}x USD${widget.cartItem.product.price!.toStringAsFixed(2)}",
                  ),
                ),
              ],
            ),
            Container(
              // padding: const EdgeInsets.only(left: 14),
              child: CustomText(
                text:
                    "\$${((widget.cartItem.product.price as double) * (widget.cartItem.quantity)).toStringAsFixed(2)}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void delete(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).remove(widget.index);
  }

  void showFullScreenBottomSheet(BuildContext context) {

    showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,

      shape: const RoundedRectangleBorder(
        // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        // Define initial values and pricing
        return DraggableScrollableSheet(
          initialChildSize: 1.0, // Full screen
          maxChildSize: 1.0,
          minChildSize: 0.25, // For flexibility if needed
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: EditCartBottomSheet(item: widget.cartItem, index:  widget.index),
            );
          },
        );
      },
    );
  }
}
