import 'package:flutter/material.dart';
import 'package:r_r_admin/components/detailed_card.dart';
import 'package:r_r_admin/components/space.dart';

class HomeCardSection extends StatelessWidget {
  final List totalData;
  const HomeCardSection({
    super.key,
    required this.size,
    required this.totalData,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceWH(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailCard(
              size: size,
              title: 'CARS',
              value: totalData[0].toString(),
            ),
            DetailCard(
              size: size,
              title: 'DRIVERS',
              value: totalData[1].toString(),
            ),
          ],
        ),
        const SpaceWH(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailCard(
              size: size,
              title: 'USERS',
              value: totalData[2].toString(),
            ),
            DetailCard(
              size: size,
              title: 'BOOKINGS',
              value: totalData[3].toString(),
            ),
          ],
        ),
      ],
    );
  }
}
