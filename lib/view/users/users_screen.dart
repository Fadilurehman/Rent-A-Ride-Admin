import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view_model/user_view_model.dart';

class UsersScreens extends StatelessWidget {
  const UsersScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerVal = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "USERS LIST"),
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
                leading: Text("${index + 1}"),
                title: Text(
                  "Fadilu Rehman",
                  style: carText,
                ),
                trailing: providerVal.isBlock
                    ? IconButton(
                        onPressed: () {
                          providerVal.userBlocked();
                        },
                        icon: const Icon(
                          Icons.person,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          providerVal.userBlocked();
                        },
                        icon: const Icon(
                          Icons.person_off,
                        ),
                      ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          const SimpleDialogOption(
                            child: Center(child: Text("User Details")),
                          ),
                          SimpleDialogOption(
                            child: RichText(
                              text: TextSpan(
                                text: "USERNAME: ",
                                style: barText,
                                children: [
                                  TextSpan(
                                      text: "Fadilu Rehman",
                                      style: bookingText),
                                ],
                              ),
                            ),
                          ),
                          SimpleDialogOption(
                            child: RichText(
                              text: TextSpan(
                                text: "EMAIL: ",
                                style: barText,
                                children: [
                                  TextSpan(
                                      text: "rehmanfadilu@gmail.com",
                                      style: bookingText),
                                ],
                              ),
                            ),
                          ),
                          SimpleDialogOption(
                            child: RichText(
                              text: TextSpan(
                                text: "PHONENUMBER: ",
                                style: barText,
                                children: [
                                  TextSpan(
                                      text: "9061334373", style: bookingText),
                                ],
                              ),
                            ),
                          ),
                          SimpleDialogOption(
                            child: providerVal.isBlock
                                ? TextButton(
                                    onPressed: () {
                                      providerVal.userBlocked();
                                      Navigator.pop(context);
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
                                      providerVal.userBlocked();
                                      Navigator.pop(context);
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
                          ),
                        ],
                      );
                    },
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
