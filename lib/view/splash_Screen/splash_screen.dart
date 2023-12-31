import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/images.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/login/login_screen.dart';
import 'package:r_r_admin/view/main/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: loggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }

          return AnimatedSplashScreen(
            backgroundColor: kwhite,
            splashIconSize: double.infinity,
            duration: 3000,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text("TURBO-RENT", style: splashHead),
                SpaceWH(
                  height: size.width * 0.1,
                ),
                // Logo
                SizedBox(
                  width: size.width * 0.8,
                  child: Image.asset(
                    splashImage,
                  ),
                ),
              ],
            ),
            nextScreen: snapshot.data!,
            splashTransition: SplashTransition.fadeTransition,
          );
        });
  }
}

Future<Widget> loggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  if (isLoggedIn == false) {
    return const LoginScreen();
  } else {
    return MainScreen();
  }
}
