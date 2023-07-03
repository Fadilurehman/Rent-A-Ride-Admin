import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view/drivers/drivers_screen.dart';
import 'package:r_r_admin/view/extras/others_screen.dart';
import 'package:r_r_admin/view/home/home_screen.dart';
import 'package:r_r_admin/view/users/users_screen.dart';
import 'package:r_r_admin/view_model/main_view_model.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List body = [
    const HomeScreen(),
    const OthersScreen(),
    const UsersScreens(),
    const DriversScreens(),
  ];

  @override
  Widget build(BuildContext context) {
    final providerVal = Provider.of<MainViewModel>(context);
    return Scaffold(
      backgroundColor: kwhite,
      body: body[providerVal.currentBottomIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          providerVal.changeBottom(value);
        },
        selectedIndex: providerVal.currentBottomIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_sharp),
            label: "Others",
          ),
          NavigationDestination(
            icon: Icon(Icons.group),
            label: "Users",
          ),
          NavigationDestination(
            icon: Icon(Icons.person_4),
            label: "Drivers",
          ),
        ],
      ),
    );
  }
}
