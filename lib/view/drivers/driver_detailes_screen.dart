import 'package:flutter/material.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';

class DriverDetails extends StatelessWidget {
  final bool isPending;
  const DriverDetails({
    super.key,
    required this.isPending,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(
          title: "DRIVER DETAILS",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: kblack,
                backgroundImage: const AssetImage("assets/images/person.png"),
              ),
            ),
            const SpaceWH(
              height: 20,
            ),
            Text(
              "Fadilu Rehman",
              style: carText,
            ),
            const SpaceWH(
              height: 70,
            ),
            Text(
              "rehmanfadilu@gmail.com",
              style: barText,
            ),
            const SpaceWH(
              height: 20,
            ),
            Text(
              "9747025461",
              style: barText,
            ),
            const SpaceWH(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/license1.jpg",
                    ),
                    fit: BoxFit.contain),
              ),
              width: size.width * 0.6,
              height: size.width * 0.5,
            ),
            const Text("LICENCE FRONT"),
            const SpaceWH(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/license2.jpg",
                    ),
                    fit: BoxFit.contain),
              ),
              width: size.width * 0.6,
              height: size.width * 0.5,
            ),
            const Text("LICENCE REAR"),
            isPending
                ? SizedBox(
                    height: size.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.green,
                            child: const Padding(
                              padding: EdgeInsets.all(15),
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
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "DECLINE",
                                style: TextStyle(color: kwhite),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: size.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.green,
                            child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "UNBLOCK",
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
                              padding: EdgeInsets.all(15),
                              child: Text(
                                "BLOCK",
                                style: TextStyle(color: kwhite),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
