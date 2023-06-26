import 'package:flutter/material.dart';

class DriverViewModel extends ChangeNotifier {
  bool _isBlock = false;
  bool get isBlock => _isBlock;
  bool _isDeclined = false;
  bool get isDeclined => _isDeclined;

  driverBlocked() {
    _isBlock = !isBlock;
    notifyListeners();
  }

  driverApproved() {
    _isDeclined = !_isDeclined;
    notifyListeners();
  }
}
