import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:r_r_admin/model/cars/add_car_model.dart';
import 'package:r_r_admin/repo/api_services.dart';
import 'package:r_r_admin/repo/api_status.dart';
import 'package:r_r_admin/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarsViewModel extends ChangeNotifier {
// call function. it is like inIt state
  CarsViewModel() {
    getAllCars();
  }

  // CarsDataModel variable
  List<CarsDataModel> _carsDataList = [];
  List<CarsDataModel> get carsDataList => _carsDataList;

// LOADING VARIABLE
  bool _isLoading = false;
  bool get isLoading => _isLoading;

// Function to know it is loading
  setLoading(bool loading) async {
    _isLoading = loading;
    // notifyListeners();
  }

// BLOCK UNBLOCK CARS
  bool _isBlock = false;
  bool get isBlock => _isBlock;

// CAR block function
  void carsBlocked() {
    _isBlock = !_isBlock;
    notifyListeners();
  }

//GET THE ACCESSTOKEN
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");
    return accessToken;
  }

  //assign the data to show in UI
  setcarsListData(List<CarsDataModel> carsDataList) async {
    _carsDataList = carsDataList;
    notifyListeners();
  }

  // MAIN FUNCTION
  getAllCars() async {
    setLoading(true);
    String url = Urls.baseUrl + Urls.admin + Urls.showCars;
    final accessToken = await getAccessToken();
    var headers = {"authorization": "Bearer $accessToken"};
    final response = await ApiServies.getMethod(
      url,
      headers,
      carsDataModelFromJson,
    );
    if (response is Success) {
      log("cars kittiii");
      // setLoading(false);
      if (response.response != null) {
        await setcarsListData(response.response as List<CarsDataModel>);
      }
    }
    if (response is Failures) {
      await setLoading(false);
    }
    setLoading(false);
  }
}
