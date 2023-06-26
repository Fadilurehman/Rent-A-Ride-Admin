import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  bool _isBlock = false;
  bool get isBlock => _isBlock;
  userBlocked() {
    _isBlock = !_isBlock;
    notifyListeners();
  }
}
