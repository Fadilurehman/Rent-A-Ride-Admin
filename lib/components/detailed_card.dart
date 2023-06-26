import 'package:flutter/material.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/text.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.size,
    required this.title,
    required this.value,
  });

  final Size size;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: SizedBox(
        width: size.width * 0.4,
        height: size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: containerHead,
            ),
            const SpaceWH(
              height: 20,
            ),
            Text(
              value,
              style: containerVal,
            ),
          ],
        ),
      ),
    );
  }
}
