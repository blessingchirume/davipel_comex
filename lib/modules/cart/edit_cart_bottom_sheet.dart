import 'package:davipel_comex/components/buttons/custom_buttom.dart';
import 'package:davipel_comex/models/responses/cart_model.dart';
import 'package:davipel_comex/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EditCartBottomSheet extends StatefulWidget {
  const EditCartBottomSheet(
      {super.key, required this.item, required this.index, });

  final CartItemModel item;
  final int index;


  @override
  State<EditCartBottomSheet> createState() => _EditCartBottomSheetState();
}

class _EditCartBottomSheetState extends State<EditCartBottomSheet> {
  int quantity = 0;
  // PriceList? selectedUnit;

  void delete(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).remove(widget.index);
  }

  @override
  void initState() {
    quantity = widget.item.quantity;
    // if (widget.item.priceList!.isNotEmpty) {
    //   // selectedUnit = widget.item.priceList?.first;
    // } else {
    //   // selectedUnit = PriceList(
    //   //   name: widget.item.uoMCode,
    //   //   basePrice: widget.item.retailZwl,
    //   //   baseQuantity: 1,
    //   // );
    // }
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle Bar
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Title and Close Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "${widget.item.product.price}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Unit Selection
          Visibility(
            // visible: widget.item.priceList!.isNotEmpty,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Unit", style: TextStyle(fontSize: 16)),
              // DropdownButton<PriceList>(
              //   value: selectedUnit,
              //   items: widget.item.priceList!.map((unit) {
              //     return DropdownMenuItem(
              //       value: unit,
              //       child: Text(unit.name!),
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       selectedUnit = value!;
              //       quantity = 1;
              //     }); // Reset quantity for new unit
              //   },
              //   borderRadius: BorderRadius.circular(8),
              // ),
            ],
          ),),
          const SizedBox(height: 16),
          // Quantity Adjustment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Quantity", style: TextStyle(fontSize: 16)),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      splashRadius: 20,
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      splashRadius: 20,
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: 30, thickness: 1, color: Colors.grey[300]),
          // Price per Unit
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //     "Price per ${selectedUnit!.baseQuantity.toString().toLowerCase()}",
              //     style: const TextStyle(fontSize: 16)),
              // Text(
              //   "\$${selectedUnit!.basePrice!.toStringAsFixed(2)}",
              //   style:
              //       const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // ),
            ],
          ),
          Divider(height: 30, thickness: 1, color: Colors.grey[300]),
          // Total Calculation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Text(
              //   "\$${((selectedUnit!.basePrice!) * quantity).toStringAsFixed(2)}",
              //   style: const TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold),
              // ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: "Save",
            onTap: () {
              // cartProvider.update(
              //   widget.index,
              //   Items(
              //       id: widget.item.id,
              //       itemNo: widget.item.itemNo,
              //       name: widget.item.name,
              //       description: widget.item.description,
              //       category: widget.item.category,
              //       uoMEntry: (selectedUnit!.baseQuantity! * quantity),
              //       retailZwl: widget.item.priceList!.isNotEmpty ? (selectedUnit!.basePrice! /
              //           selectedUnit!.baseQuantity!) : widget.item.retailZwl,
              //       quantity: (selectedUnit!.baseQuantity! * quantity),
              //       priceList: widget.item.priceList),
              // );
              setState(() {});
              Navigator.pop(context);
            },
          ),
          // Save Button
          const SizedBox(height: 10),
          // Cancel Button
          TextButton(
            onPressed: () {
              delete(context);
              Navigator.pop(context);
            },
            child: const Text(
              "Delete",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
