import 'package:flutter/material.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/extras/bookings/booking_details_screen.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8, bottom: 8),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: SizedBox(
            width: size.width * 0.95,
            height: size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "USER:  ",
                      style: barText,
                    ),
                    Text(
                      "CAR NAME:  ",
                      style: barText,
                    ),
                    Text(
                      "PICKUP DATE:  ",
                      style: barText,
                    ),
                    Text(
                      "PHONE NUMBER:  ",
                      style: barText,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fadilu",
                      style: bookingText,
                    ),
                    Text(
                      "MINI COOPER",
                      style: bookingText,
                    ),
                    Text(
                      "APR 01 2023 12:00",
                      style: bookingText,
                    ),
                    Text(
                      "9061334373",
                      style: bookingText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /// on tap to the card
        /// go to the booking details
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const BookingDetailsScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
