import 'package:davipel_comex/models/responses/product_model.dart';
import 'package:flutter/material.dart';


class ProductDetailsDialog extends StatefulWidget {
  const ProductDetailsDialog({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailsDialog> createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Name', ),
            trailing: Text(
              '${widget.product.name}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: const Text('Item Description'),
            trailing: Text(
              '${widget.product.description}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: const Text('Price'),
            trailing: Text(
              '${widget.product.price}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          ListTile(
            title: const Text('Available Stock'),
            trailing: Text(
              '${widget.product.stock}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
