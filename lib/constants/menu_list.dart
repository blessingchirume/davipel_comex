import 'package:davipel_comex/constants/routing_constants.dart';
import 'package:flutter/material.dart';

class Menu {
  static List<SubMenu> manageSales = [
    SubMenu(icon:  const Icon(Icons.sell_outlined), name: 'Daily Sales', url: RoutingConstants.sales),
    // SubMenu(name: 'Cash Management', url: RoutingConstants.cashManagement)
  ];

  static List<SubMenu> products = [
    SubMenu(icon:  const Icon(Icons.inventory_2_outlined), name: 'Inventory Transfers (IT)', url: RoutingConstants.productListing),
    SubMenu(icon:  const Icon(Icons.category_outlined), name: 'Inventory Transfer Requests (ITR)', url: RoutingConstants.categories)
  ];

  static List<SubMenu> inventory = [
    SubMenu(icon:  const Icon(Icons.receipt_outlined), name: 'Goods received notes (GRN)', url: RoutingConstants.grn),
    // SubMenu(name: 'Inventory Revaluation (IR)', url: RoutingConstants.cart),
    // SubMenu(name: 'Inventory Transfers (IT)', url: RoutingConstants.cart)
  ];
  static List<SubMenu> reports = [
    SubMenu(icon:  const Icon(Icons.shopify_sharp), name: 'Sales Report', url: RoutingConstants.salesReport),
    // SubMenu(name: 'Product Sales Report', url: RoutingConstants.cart),
    // SubMenu(name: 'Category Sales Report', url: RoutingConstants.cart),
    // SubMenu(
    //     name: 'Employee Sales Report',
    //     url: RoutingConstants.featureNotYetAvailable),
  ];
  static List<SubMenu> settings = [
    SubMenu(icon:  const Icon(Icons.dashboard_customize_outlined), name: 'Software Customization', url: RoutingConstants.appSettings),
    SubMenu(icon:  const Icon(Icons.print_outlined), name: 'Printers', url: RoutingConstants.pairedPrinters),
    SubMenu(icon:  const Icon(Icons.percent_outlined), name: 'Taxes', url: RoutingConstants.tax),
    SubMenu(icon:  const Icon(Icons.account_circle_outlined), name: 'Account', url: RoutingConstants.profile),
  ];
}

class SubMenu {
  Icon icon;
  String? name;

  String? url;

  SubMenu({required this.icon, this.name, this.url});
}