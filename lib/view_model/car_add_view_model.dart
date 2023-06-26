import 'dart:developer';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:r_r_admin/components/common_snackbar.dart';
import 'package:r_r_admin/model/cars/add_car_models.dart';
import 'package:r_r_admin/repo/api_services.dart';
import 'package:r_r_admin/repo/api_status.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/urls.dart';
import 'package:r_r_admin/view/extras/cars/cars_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarAddViewModel extends ChangeNotifier {
  // NAME OF THE CAR
  TextEditingController nameController = TextEditingController();

  // RENT OF THE CAR
  TextEditingController rentController = TextEditingController();

  // DESCRIPTIOIN OF THE CAR
  TextEditingController descrptnController = TextEditingController();

  // PLACE OF THE CAR
  TextEditingController placeController = TextEditingController();

  // BRAND OF THE CAR
  TextEditingController brandController = TextEditingController();

  // BODY OF THE CAR
  TextEditingController bodyController = TextEditingController();

  // TRANSMISSION OF THE CAR[AUTO, MANUAL]
  TextEditingController transmissionController = TextEditingController();

  // FUEL OF THE CAR
  TextEditingController fuelController = TextEditingController();

  // MODEL NUMBER OF THE CAR
  TextEditingController modelController = TextEditingController();

  // FORMKEY OF THE ENTIRE ADD CAR FIELDS
  GlobalKey<FormState> addCarFormKey = GlobalKey<FormState>();

  BoxBorder? border;

  String? carImageUrl;

  File? _carImage;
  File? get carImage => _carImage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AddCarError? _addCarError;
  AddCarError get addCarError => _addCarError!;

// Create an instance of cloudinary
  final cloudinary = Cloudinary.signedConfig(
    apiKey: "124276556947198",
    apiSecret: "Sh55-mZRH3V_ZPzyP0Pyv-c2Qlo",
    cloudName: "drncyj74b",
  );

  // Function to know it is loading
  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  setBorderError(BoxBorder? boxBorder) {
    border = boxBorder;
    notifyListeners();
  }

  setImage(File? carimage) {
    _carImage = carimage;
    notifyListeners();
  }

  setAddCarError(AddCarError addCarError, context) async {
    _addCarError = addCarError;
    return errorResponses(_addCarError!, context);
  }

// GET access token
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");
    return accessToken;
  }

// Clear the controllers
  clearController() {
    nameController.clear();
    bodyController.clear();
    brandController.clear();
    descrptnController.clear();
    fuelController.clear();
    modelController.clear();
    placeController.clear();
    rentController.clear();
    transmissionController.clear();
    _carImage = null;
  }

  // The body to pass in the method
  Map<String, dynamic> addCarBody() {
    final body = AddCarsModel(
      body: bodyController.text.trim(),
      brand: brandController.text.trim(),
      description: descrptnController.text.trim(),
      fuel: fuelController.text.trim(),
      model: modelController.text.trim(),
      name: nameController.text.trim(),
      place: placeController.text.trim(),
      rent: rentController.text.trim(),
      transmission: transmissionController.text.trim(),
      image: carImageUrl,
    );
    return body.toJson();
  }

  errorResponses(AddCarError addCarError, BuildContext context) {
    final statusCode = addCarError.code;
    if (statusCode == 400 || statusCode == 500) {
      return CommonSnackBar.snackBar(
        context: context,
        data: "Invalid details",
        color: snackbarRed,
      );
    }
    return CommonSnackBar.snackBar(
      context: context,
      data: "No Internet connection",
      color: snackbarRed,
    );
  }

  //GET ALL CARS
  getAddCarStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.admin + Urls.addCar;
    log(url);
    final accessToken = await getAccessToken();
    var headers = {"authorization": "Bearer $accessToken"};
    // ignore: use_build_context_synchronously
    final response = await ApiServies.postCarmethod(
      url,
      addCarBody(),
      context,
      headers,
    );

    if (response is Success) {
      clearController();
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return const CarsScreen();
        },
      ), (route) => false);
    }

    if (response is Failures) {
      log("car add aakunillaa");
      log(response.code.toString());
      await setLoading(false);
      AddCarError addCarError = AddCarError(
        code: response.code,
        message: response.errrorResponse,
      );
      // ignore: use_build_context_synchronously
      await setAddCarError(addCarError, context);
    }
    setLoading(false);
  }

//PICK IMAGE FROM THE GALLERY
// AND POST TO THE CLOUDINARY
  pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    File? carImage;
    if (img != null) {
      carImage = File(img.path);
      setImage(carImage);
      CloudinaryResponse response = await cloudinary.upload(
        file: carImage.path,
        fileBytes: carImage.readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );
      if (response.isSuccessful) {
        log("image cloudianryil ethi");
        log(response.secureUrl.toString());
        carImageUrl = response.secureUrl.toString();
        log(carImageUrl.toString());
      }
    } else {
      setBorderError(
        Border.all(color: Colors.red, width: 2),
      );
    }
  }
}

class AddCarError {
  int? code;
  Object? message;

  AddCarError({
    this.code,
    this.message,
  });
}
