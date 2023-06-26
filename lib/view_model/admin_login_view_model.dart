import 'package:flutter/material.dart';
import 'package:r_r_admin/components/common_snackbar.dart';
import 'package:r_r_admin/model/admin_login_model.dart';
import 'package:r_r_admin/repo/api_services.dart';
import 'package:r_r_admin/repo/api_status.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/urls.dart';
import 'package:r_r_admin/view/main/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginViewModel with ChangeNotifier {
  // ADMIN USERNAME CONTROLLER
  TextEditingController userNameController = TextEditingController();

  // ADMIN PASSWORD CONTROLLER
  TextEditingController passwordController = TextEditingController();

  // LOGIN FIELDS FORM KEY
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // LOADING VARIABLE
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ///ADMIN LOGIN MODEL
  ///To save the accessToken
  ///To know the admin already signed or not
  AdminLoginModel? _adminData;
  AdminLoginModel get adminData => _adminData!;

  // LOGIN ERROR CLASS VARIABLES
  LoginError? _loginError;
  LoginError get loginError => _loginError!;

  // Function to know it is loading
  setLoading(bool loading) async {
    _isLoading = loading;
    notifyListeners();
  }

  ///SAVE THE ACCESSTOKEN
  ///SAVE THE BOOL VARIBLE TRUE IF ADMIN LOGGED IN
  setLoginStatus(String accessToken) async {
    final status = await SharedPreferences.getInstance();
    await status.setBool("isLoggedIn", true);
    await status.setString("ACCESS_TOKEN", accessToken);
  }

  ///assign admin data model
  Future<AdminLoginModel?> setAdminData(AdminLoginModel adminData) async {
    _adminData = adminData;
    return _adminData;
  }

  ///THE BODY WHICH WE WANT TO PASS IN THE POST METHOD
  Map<String, dynamic> adminDataBody() {
    final body = AdminLoginModel(
      userName: userNameController.text.trim(),
      password: passwordController.text.trim(),
    );
    return body.toJson();
  }

  ///setLogin error and pass into the errorResponse method
  setLoginError(LoginError loginError, context) async {
    _loginError = loginError;
    return errorResponses(_loginError!, context);
  }

  //Error response method to show snackbar in UI
  errorResponses(LoginError loginError, BuildContext context) {
    final statusCode = loginError.code;
    if (statusCode == 400 || statusCode == 500) {
      return CommonSnackBar.snackBar(
        context: context,
        data: "Invalid Username or password",
        color: snackbarRed,
      );
    }
    return CommonSnackBar.snackBar(
      context: context,
      data: "No internet connection",
      color: snackbarRed,
    );
  }

  // Clear textfiled after admin login successfully
  clearController() {
    userNameController.clear();
    passwordController.clear();
  }

// MAIN POST METHOD
  getLoginStatus(BuildContext context) async {
    final navigator = Navigator.of(context);
    setLoading(true);
    String url = Urls.baseUrl + Urls.admin + Urls.adminLogin;
    final response = await ApiServies.postmethod(
      url,
      adminDataBody(),
      context,
      adminLoginModelFromJson,
    );
    //if the response is success
    if (response is Success) {
      final data = await setAdminData(response.response as AdminLoginModel);
      final accessToken = data!.token;
      clearController();
      setLoginStatus(accessToken!);
      navigator.pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return MainScreen();
        },
      ), (route) => false);
    }
//if the response is failure
    if (response is Failures) {
      await setLoading(false);
      LoginError loginError = LoginError(
        code: response.code,
        message: response.errrorResponse,
      );
      // ignore: use_build_context_synchronously
      await setLoginError(loginError, context);
    }
    setLoading(false);
  }
}

class LoginError {
  int? code;
  Object? message;

  LoginError({
    this.code,
    this.message,
  });
}
