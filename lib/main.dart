import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view/splash_Screen/splash_screen.dart';
import 'package:r_r_admin/view_model/admin_login_view_model.dart';
import 'package:r_r_admin/view_model/bookings_view_model.dart';
import 'package:r_r_admin/view_model/brand_place_view_model.dart';
import 'package:r_r_admin/view_model/car_add_view_model.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';
import 'package:r_r_admin/view_model/driver_view_model.dart';
import 'package:r_r_admin/view_model/main_view_model.dart';
import 'package:r_r_admin/view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AdminLoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BrandPlaceViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarAddViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'T-R-ADMIN',
        theme: ThemeData(
          primaryColor: Colors.grey[900],
          scaffoldBackgroundColor: background,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
