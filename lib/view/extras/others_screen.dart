import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/components/detailed_card.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view/extras/bookings/bookings_screens.dart';
import 'package:r_r_admin/view/extras/brands/brands_screen.dart';
import 'package:r_r_admin/view/extras/cars/cars_screen.dart';
import 'package:r_r_admin/view/extras/places/places_screen.dart';
import 'package:r_r_admin/view_model/brand_place_view_model.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerCars = context.watch<CarsViewModel>().carsDataList;
    final brandsPlace = context.watch<BrandPlaceViewModel>();
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "ITEMS"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceWH(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CarsScreen();
                        },
                      ),
                    );
                  },
                  child: DetailCard(
                    size: size,
                    title: "CARS",
                    value: providerCars.length.toString(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BookingsScreens();
                        },
                      ),
                    );
                  },
                  child: DetailCard(
                    size: size,
                    title: "BOOKINGS",
                    value: "25",
                  ),
                ),
              ],
            ),
            const SpaceWH(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BrandsScreen();
                        },
                      ),
                    );
                  },
                  child: DetailCard(
                    size: size,
                    title: "BRANDS",
                    value: brandsPlace.brandDataList.length.toString(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PlacesScreen();
                        },
                      ),
                    );
                  },
                  child: DetailCard(
                    size: size,
                    title: "PLACES",
                    value: "25",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
