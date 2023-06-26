import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view/home/components/home%20graph/bar_graph.dart';
import 'package:r_r_admin/view/home/components/home_appbar.dart';
import 'package:r_r_admin/view/home/components/home_card_section.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerCars = context.watch<CarsViewModel>().carsDataList;

    // List of totaldata
    List<int> totalData = [
      providerCars.length,
      10,
      20,
      40,
    ];
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const HomeAppBAr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCardSection(
              size: size,
              totalData: totalData,
            ),
            SpaceWH(
              height: size.width * 0.2,
            ),
            BarGraphSection(
              totalData: totalData,
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
