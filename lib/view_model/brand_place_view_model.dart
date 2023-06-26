import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:r_r_admin/model/brand/view_brand_model.dart';
import 'package:r_r_admin/repo/api_services.dart';
import 'package:r_r_admin/repo/api_status.dart';
import 'package:r_r_admin/utils/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandPlaceViewModel extends ChangeNotifier {
  TextEditingController brandController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  GlobalKey<FormState> addBrandFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> addPlaceFormKey = GlobalKey<FormState>();

  BrandPlaceViewModel() {
    getAllBrands();
  }

// LOADING VARIABLE
  bool _isLoading = false;
  bool get isLoading => _isLoading;

// Function to know it is loading
  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

//BRANDS DATA MODEL
  List<ViewBrandModel> _brandDataList = [];
  List<ViewBrandModel> get brandDataList => _brandDataList;

  //GET THE ACCESSTOKEN
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");
    return accessToken;
  }

  //assign the data to show in UI
  setBrandsListData(List<ViewBrandModel> brandDataList) async {
    _brandDataList = brandDataList;
    notifyListeners();
  }

  clearBrandfield() {
    brandController.clear();
  }

  clearPlacefield() {
    placeController.clear();
  }

  getAllBrands() async {
    setLoading(true);
    String url = Urls.baseUrl + Urls.admin + Urls.showBrands;
    final accessToken = await getAccessToken();
    final headers = {"authorization": "Bearer $accessToken"};
    final response =
        await ApiServies.getMethod(url, headers, viewBrandModelFromJson);

    if (response is Success) {
      log("brands kittiii");
      // setLoading(false);
      if (response.response != null) {
        await setBrandsListData(response.response as List<ViewBrandModel>);
      }
    }
    if (response is Failures) {
      await setLoading(false);
    }
    setLoading(false);
  }
}
