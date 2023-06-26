import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/view/extras/cars/car_add_screen.dart';
import 'package:r_r_admin/view/extras/cars/car_detail_screen.dart';
import 'package:r_r_admin/view/extras/cars/components/car_card.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  final image = "assets/images/car1.png";

  @override
  Widget build(BuildContext context) {
    final providerCars = context.watch<CarsViewModel>().carsDataList;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CommonAppbar(
          title: "CARS",
          widget: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CarAddScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CarDetailsScreen(
                        image: image,
                        index: index,
                      );
                    },
                  ),
                );
              },
              child: CarCard(
                size: size,
                index: index,
              ),
            ),
          );
        },
        itemCount: providerCars.length,
      ),
    );
  }
}
