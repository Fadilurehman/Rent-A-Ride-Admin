import 'package:flutter/material.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/splash_Screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBAr extends StatelessWidget {
  const HomeAppBAr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello",
            style: barText,
          ),
          Text(
            "Ijas Ahammed",
            style: bookingText,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.remove("isLoggedIn");
            // ignore: use_build_context_synchronously
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const SplashScreen();
              },
            ), (route) => false);
          },
          child: Text(
            "LOG OUT",
            style: barText,
          ),
        ),
        const SpaceWH(
          width: 20,
        )
      ],
    );
  }
}
