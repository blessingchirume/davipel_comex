// cart_provider.dart
import 'package:davipel_comex/models/responses/cart_model.dart';
import 'package:davipel_comex/models/responses/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final CartModel _cart = CartModel();

  CartModel get cart => _cart;

  void addToCart(ProductModel product) {
    _cart.addProduct(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void remove(int index) {}
}