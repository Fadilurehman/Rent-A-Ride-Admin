import 'package:flutter/material.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/drivers/driver_detailes_screen.dart';

class DriverPendings extends StatelessWidget {
  const DriverPendings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(
          title: "PENDING DRIVERS",
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: kblack,
                  backgroundImage: AssetImage(
                    "assets/images/carLogo.png",
                  ),
                ),
                title: Text(
                  "Fadilu Rehman",
                  style: carText,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.green,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "APPROVE",
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "DECLINE",
                            style: TextStyle(color: kwhite),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DriverDetails(
                          isPending: true,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
