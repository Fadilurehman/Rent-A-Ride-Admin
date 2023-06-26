import 'package:flutter/material.dart';

class BookingsViewModel extends ChangeNotifier {
  String _changeDropDown ="BOOKED";
  String get changeDropDown => _changeDropDown;

  changeDropDownButton(String index) {
    _changeDropDown = index;
    notifyListeners();
  }
}
