import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/extras/cars/components/cars_block.dart';
import 'package:r_r_admin/view/extras/cars/components/delete_dialog.dart';
import 'package:r_r_admin/view_model/cars_view_model.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;
  @override
  Widget build(BuildContext context) {
    final proCars = context.watch<CarsViewModel>();
    return Card(
      child: SizedBox(
        height: size.width * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width * 0.3,
                child: Image.network(
                  proCars.carsDataList[index].image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      // car BLOCK and UNBLOCK
                      CarsBlock(
                        index: index,
                      ),
                      // car Edit Details
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: blackBG,
                        ),
                      ),
                      // car Delete Details
                      IconButton(
                        onPressed: () {
                          DeleteDialog.showDeleteDialog(context, "Car");
                        },
                        icon: const Icon(
                          Icons.delete_outlined,
                          color: snackbarRed,
                        ),
                      ),
                    ],
                  ),
                  const SpaceWH(
                    height: 10,
                  ),
                  Text(
                    proCars.carsDataList[index].name.toString().toUpperCase(),
                    style: carText,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SpaceWH(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        color: grey300,
                        child: Text(
                          proCars.carsDataList[index].place.toString(),
                        ),
                      ),
                      const SpaceWH(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        color: grey300,
                        child: Text(
                          "${proCars.carsDataList[index].rent}/hr",
                        ),
                      ),
                      const SpaceWH(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        color: grey300,
                        child:
                            Text(proCars.carsDataList[index].model.toString()),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
