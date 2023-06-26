import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_elevated.dart';
import 'package:r_r_admin/components/common_textfields.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view_model/admin_login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Media Query
    final size = MediaQuery.of(context).size;
    // Provider value
    final providervalue = context.watch<AdminLoginViewModel>();

    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SizedBox(
                height: size.width * 0.8,
                child: Form(
                  key: providervalue.loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "WELCOME BACK!",
                        style: loginHead,
                      ),
// Username textfield
                      TextFormFields(
                        keyType: TextInputType.name,
                        size: size,
                        hintText: " USERNAME",
                        controller: providervalue.userNameController,
                        isAdmin: true,
                      ),
// password textfield
                      TextFormFields(
                        keyType: TextInputType.name,
                        size: size,
                        hintText: " PASSWORD",
                        controller: providervalue.passwordController,
                        isPassword: true,
                      ),
// Button
                      providervalue.isLoading
                          ? CommonElevated(
                              onTap: () {},
                              color: kblack,
                              child: const Text("LOADING..."))
                          : CommonElevated(
                              color: blueButton,
                              onTap: () async {
                                if (providervalue.loginFormKey.currentState!
                                    .validate()) {
                                  await context
                                      .read<AdminLoginViewModel>()
                                      .getLoginStatus(context);
                                }
                              },
                              child: const Text("LOGIN"),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
