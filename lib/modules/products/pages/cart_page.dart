// cart_summary.dart
import 'package:davipel_comex/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'CHARGE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${cart.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const Divider(),
          // if (cart.items.isNotEmpty) ...[
          //   const Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       'All items',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //   ),
          //   const SizedBox(height: 8),
          //   ...cart.items.map((item) => Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 4),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               '${item.product.name} (x${item.quantity})',
          //               style: const TextStyle(fontSize: 14),
          //             ),
          //             Text(
          //               '\$${(item.totalPrice).toStringAsFixed(2)}',
          //               style: const TextStyle(fontSize: 14),
          //             ),
          //           ],
          //         ),
          //       )),
          // ],
        ],
      ),
    );
  }
}
