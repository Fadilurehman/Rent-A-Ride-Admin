import 'package:flutter/material.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';

class CommonAppbar extends StatelessWidget {
  final String title;
  final Widget widget;
  const CommonAppbar({
    super.key,
    required this.title,
    this.widget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: kblack),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: bookingText,
      ),
      actions: [
        widget,
        const SpaceWH(
          width: 10,
        )
      ],
    );
  }
}
