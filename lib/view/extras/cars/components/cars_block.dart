import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class CarsBlock extends StatelessWidget {
  final int index;
  const CarsBlock({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final providerVal = Provider.of<CarsViewModel>(context);
    final providerCars = context.watch<CarsViewModel>().carsDataList;
    return SizedBox(
      child: providerCars[index].isBlocked!
          ? ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                providerVal.carsBlocked();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "UN-BLOCK",
                ),
              ),
            )
          : ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(snackbarRed),
              ),
              onPressed: () {
                providerVal.carsBlocked();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "BLOCK",
                ),
              ),
            ),
    );
  }
}
