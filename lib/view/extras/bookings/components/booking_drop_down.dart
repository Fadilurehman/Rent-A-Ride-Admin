import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view_model/bookings_view_model.dart';

class BookingStatsDropDown extends StatelessWidget {
  const BookingStatsDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerVal = Provider.of<BookingsViewModel>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25,
        top: 20,
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          labelText: "CHANGE STATUS",
          labelStyle: bookingText,
          prefixIcon: const Icon(
            Icons.book_online,
            color: Colors.deepPurple,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
        value: providerVal.changeDropDown,
        iconSize: 20,
        dropdownColor: Colors.deepPurple.shade50,
        elevation: 16,
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          color: Colors.deepPurple,
        ),
        items: <String>['BOOKED', 'CANCELLED', 'PICKED', "DELIVERED"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          providerVal.changeDropDownButton(newValue!);
        },
      ),
    );
  }
}
