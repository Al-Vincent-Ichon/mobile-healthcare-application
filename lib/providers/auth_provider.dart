import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String email, String role) {
    _user = User(email: email, role: role);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
