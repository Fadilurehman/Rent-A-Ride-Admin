import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view/extras/cars/components/car_details_table.dart';
import 'package:r_r_admin/view/extras/cars/components/cars_block.dart';
import 'package:r_r_admin/view/extras/cars/components/delete_dialog.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({
    super.key,
    required this.image,
    required this.index,
  });
  final String image;
  final int index;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerCars = context.watch<CarsViewModel>().carsDataList;
    return Scaffold(
      // APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CommonAppbar(
          title: "CARS",
          widget: Row(
            children: [
              //car edit details
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: specialGreen,
                ),
              ),
              // car delete details
              IconButton(
                onPressed: () {
                  DeleteDialog.showDeleteDialog(
                    context,
                    "Car",
                  );
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: snackbarRed,
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image of the vehicle
              SizedBox(
                height: size.width * 0.5,
                width: size.width * 1,
                child: Image.network(
                  providerCars[index].image!,
                  fit: BoxFit.contain,
                ),
              ),
              //car details in the table
              CarDetailsTable(
                index: index,
              ),
              //car block and unblock
              CarsBlock(
                index: index,
              )
            ],
          ),
        ),
      ),
    );
  }
}
