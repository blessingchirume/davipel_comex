import 'package:davipel_comex/models/responses/user_response_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  UserModel get user => _user!;

  set user(UserModel model) {
    _user = model;
    // notifyListeners();
  }
}
