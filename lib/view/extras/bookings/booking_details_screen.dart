import 'package:flutter/material.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/components/table.dart';
import 'package:r_r_admin/view/extras/bookings/components/booking_drop_down.dart';

String dropdownValue = 'Hello';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "BOOKING DETAILS"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SpaceWH(
              height: 30,
            ),
            SizedBox(
              height: size.width * 0.5,
              width: size.width * 1,
              child: Image.asset(
                "assets/images/car1.png",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12,
              ),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("USER"),
                      TableWidget.tableCellData("title"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("CAR NAME"),
                      TableWidget.tableCellData("MINI COOPER"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("PICKUP DATE"),
                      TableWidget.tableCellData("APR 01 2023 12:00"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("DROPOFF DATE"),
                      TableWidget.tableCellData("APR 02 2023 02:00"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("TOTAL HOURS"),
                      TableWidget.tableCellData("14"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("TOTAL AMOUNT"),
                      TableWidget.tableCellData("9000"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("DROPOFF CITY"),
                      TableWidget.tableCellData("NILAMBUR"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("PHONE NUMBER"),
                      TableWidget.tableCellData("9747025461"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("DRIVER"),
                      TableWidget.tableCellData("NOT REQUIRED"),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableWidget.tableCellHead("PAYMENT"),
                      TableWidget.tableCellData("SUCCESS"),
                    ],
                  ),
                ],
              ),
            ),
            const BookingStatsDropDown(),
          ],
        ),
      ),
    );
  }
}
