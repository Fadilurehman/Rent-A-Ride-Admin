import 'package:flutter/material.dart';
import 'package:r_a_r_admin/utils/colors.dart';

class CommonSnackBar {
  static snackBar({
    required BuildContext context,
    required String data,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          data,
          style: const TextStyle(color: kblack),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: const EdgeInsets.all(15),
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        clipBehavior: Clip.hardEdge,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
