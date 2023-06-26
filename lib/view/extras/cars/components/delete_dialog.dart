import 'package:flutter/material.dart';
import 'package:r_r_admin/components/common_snackbar.dart';
import 'package:r_r_admin/utils/colors.dart';

class DeleteDialog {
  static Future showDeleteDialog(
    context,
    String title,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kwhite,
          title: Text(
            "Delete $title",
            style: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
          ),
          content: Text(
            "Are you sure you want to delete this $title?",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                CommonSnackBar.snackBar(
                    context: context,
                    data: "Deleted Successfully",
                    color: snackbarRed);
                Navigator.pop(context);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
