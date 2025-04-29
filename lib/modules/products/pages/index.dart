// product_selection_page.dart
import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:davipel_comex/models/responses/product_model.dart';
import 'package:davipel_comex/modules/products/pages/cart_page.dart';
import 'package:davipel_comex/modules/products/services/product_service.dart';
import 'package:davipel_comex/modules/products/widgets/product_card.dart';
import 'package:davipel_comex/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSelectionPage extends StatefulWidget {
  final ProductService productService;

  const ProductSelectionPage({Key? key, required this.productService}) : super(key: key);

  @override
  _ProductSelectionPageState createState() => _ProductSelectionPageState();
}

class _ProductSelectionPageState extends State<ProductSelectionPage> {
  late Future<List<ProductModel>> _productsFuture;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _productsFuture = widget.productService.fetchProducts();
  }

  Future<void> _refreshProducts() async {
    setState(() {
      _productsFuture = widget.productService.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Products', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: const Icon(Icons.payment, color: Colors.white),
            onPressed: () => Navigator.of(context).pushNamed(RoutingConstants.cart),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () => _showCartDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _refreshProducts,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<ProductModel>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No products available'));
                } else {
                  final products = snapshot.data!.where((product) =>
                      product.name!.toLowerCase().contains(_searchQuery)).toList();

                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),  // Add spacing between items
                        child: ProductCard(product: product),       // Reuse your existing ProductCard
                      );
                    },
                  );
                }
              },
            ),
          ),
          const CartSummary(),
        ],
      ),
    );
  }

  void _showCartDialog(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false).cart;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Cart'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (cart.items.isEmpty)
              const Text('Your cart is empty')
            else ...[
              ...cart.items.map((item) => ListTile(
                title: Text(item.product.name ?? ''),
                subtitle: Text('Quantity: ${item.quantity}'),
                trailing: Text('\$${item.totalPrice.toStringAsFixed(2)}'),
              )),
              const Divider(),
              Text(
                'Total: \$${cart.total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continue Shopping'),
          ),
          if (cart.items.isNotEmpty)
            TextButton(
              onPressed: () {
                // Implement checkout logic
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout completed')),
                );
                Provider.of<CartProvider>(context, listen: false).clearCart();
              },
              child: const Text('Checkout'),
            ),
        ],
      ),
    );
  }
}