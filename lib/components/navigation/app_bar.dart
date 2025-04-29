import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:davipel_comex/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;
  final String title;
  final bool showCustomerIcon;
  final bool showCartIcon;
  final bool showSearchIcon;
  final bool showDiscountIcon;
  final List<Widget> actions;
  const CustomAppBar(
      {super.key,
      this.automaticallyImplyLeading,
      required this.title,
      this.showCustomerIcon = false,
      this.showCartIcon = false,
      this.showDiscountIcon = false,
      this.showSearchIcon = false, this.actions = const []});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context).cart;
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: false,
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Visibility(
          visible: showCartIcon,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutingConstants.cart);
              },
              icon: Badge(
                label: Text(
                  cart.items.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icons/Bag.svg",
                  height: 24,
                  color: Colors.white.withOpacity(
                      Theme.of(context).brightness == Brightness.dark
                          ? 0.3
                          : 1),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: showSearchIcon,
          child: IconButton(
            onPressed: () {
              
             // Navigator.of(context)
             //      .push(MaterialPageRoute(builder: (_) => const SearchPage()));
              // Navigator.pushNamed(context, RoutingConstants.cart);
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
              color: Colors.white.withOpacity(
                  Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            ),
          ),
        ),
        ...actions
      ],
    );
  }
}
