// cart_item_model.dart
import 'package:davipel_comex/models/responses/product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price! * quantity;
}

// cart_model.dart
class CartModel {
  final List<CartItemModel> items = [];

  double get total => items.fold(0, (sum, item) => sum + item.totalPrice);

  void addProduct(ProductModel product) {
    final existingIndex = items.indexWhere((item) => item.product.code == product.code);

    if (existingIndex >= 0) {
      items[existingIndex].quantity++;
    } else {
      items.add(CartItemModel(product: product));
    }
  }

  void removeProduct(ProductModel product) {
    items.removeWhere((item) => item.product.code == product.code);
  }

  void clear() {
    items.clear();
  }
}