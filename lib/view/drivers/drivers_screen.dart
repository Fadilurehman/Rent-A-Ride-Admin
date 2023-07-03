import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/drivers/driver_detailes_screen.dart';
import 'package:r_r_admin/view/drivers/driver_pending_screen.dart';
import 'package:r_r_admin/view_model/driver_view_model.dart';

class DriversScreens extends StatelessWidget {
  const DriversScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerVal = context.watch<DriverViewModel>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CommonAppbar(
            title: "DRIVERS LIST",
            widget: Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DriverPendings();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none,
                      color: kwhite,
                    )),
                Positioned(
                  top: 0,
                  right: 6,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text("3"),
                  ),
                )
              ],
            )),
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
                    "assets/images/person.jpeg",
                  ),
                ),
                title: Text(
                  "Fadiu Rehman",
                  style: carText,
                ),
                trailing: providerVal.isBlock
                    ? TextButton(
                        onPressed: () {
                          providerVal.driverBlocked();
                        },
                        child: Container(
                          color: Colors.green,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "UN-BLOCK",
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          providerVal.driverBlocked();
                        },
                        child: Container(
                          color: Colors.red,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "BLOCK",
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                        ),
                      ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DriverDetails(
                          isPending: false,
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
