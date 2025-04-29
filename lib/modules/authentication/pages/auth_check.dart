// AuthCheck decides whether to show LoginScreen or HomeScreen
import 'package:davipel_comex/constants/api_constants.dart';
import 'package:davipel_comex/models/responses/user_response_model.dart';
import 'package:davipel_comex/modules/authentication/controller/authentication_controller.dart';
import 'package:davipel_comex/modules/authentication/pages/login_page.dart';
import 'package:davipel_comex/modules/products/pages/index.dart';
import 'package:davipel_comex/modules/products/services/product_service.dart';
import 'package:davipel_comex/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool _isLoading = true;
  bool _isLoggedIn = false;
  UserModel? user;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();

    print("into the unknown");
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      user = await AuthenticationController().retrieveUserData();
    }

    setState(() {
      _isLoggedIn = user != null; // User is logged in if userData exists
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_isLoggedIn) {
      Provider.of<UserProvider>(context, listen: false).user = user!;
      return ProductSelectionPage(productService: ProductService(baseUrl: ApiConstants.products));
    }
    return LoginPage();
  }
}
