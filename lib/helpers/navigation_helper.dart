import 'package:davipel_comex/components/navigation/menu_option.dart';
import 'package:davipel_comex/models/responses/user_response_model.dart';
import 'package:davipel_comex/modules/authentication/pages/auth_check.dart';
import 'package:davipel_comex/modules/authentication/pages/login_page.dart';
import 'package:davipel_comex/modules/products/pages/index.dart';
import 'package:davipel_comex/modules/products/services/product_service.dart';
import 'package:davipel_comex/constants/api_constants.dart'; // Add this import
import 'package:davipel_comex/modules/cart/shopping_cart.dart';
import 'package:davipel_comex/modules/dashboard/pages/dashboard.dart';
import 'package:davipel_comex/modules/payments/pages/company_products_page.dart';
import 'package:flutter/material.dart';

import '../constants/routing_constants.dart';
import '../modules/payments/pages/agent_float_topup.dart';
import '../modules/payments/pages/econet_bundles_page.dart';
import '../modules/payments/pages/payment_page.dart';
import '../modules/payments/pages/telone_products.dart';

class NavigationHelper {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // Convenience and navigation

    // App settings
      case RoutingConstants.login:
        return navigateToPage(LoginPage(), settings);

      case RoutingConstants.dashboard:
        return navigateToPage(DashboardPage(), settings);

      case RoutingConstants.payment:
      // return navigateToPage(PaymentPage(product: settings.arguments));

      case RoutingConstants.companyProducts:
      // return navigateToPage(CompanyProductsPage());

      case RoutingConstants.cart:
        return navigateToPage(ShoppingCartWidget(), settings);

      case RoutingConstants.menu:
        return navigateToPage(const MenuOption(),settings);

      case RoutingConstants.customerInfo:
        return navigateToPage(MakeSaleScreen(), settings);

      case RoutingConstants.agentFloat:
        return navigateToPage(AgentFloatTopupPage(), settings);

      case RoutingConstants.bundlePurchase:
      // return navigateToPage(MakeEconetSaleScreen());

      case RoutingConstants.authCheck:
        return navigateToPage(const AuthCheck(), settings);
      case RoutingConstants.productSelection:  // Add this new case
        return navigateToPage(ProductSelectionPage(
          productService: ProductService(baseUrl: ApiConstants.products),
        ), settings);

      default:
        return navigateToPage(LoginPage(), settings);
    }
  }

  static MaterialPageRoute<dynamic> navigateToPage(
      dynamic page, RouteSettings settings) =>
      MaterialPageRoute(builder: (_) => page, settings: settings);
}