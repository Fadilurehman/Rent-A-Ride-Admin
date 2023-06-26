import 'package:flutter/material.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view/extras/bookings/components/booking_card.dart';

class BookingsScreens extends StatelessWidget {
  const BookingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "BOOKING STATUS"),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return BookingCard(size: size);
        },
      ),
    );
  }
}
