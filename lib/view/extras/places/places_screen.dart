import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/components/common_snackbar.dart';
import 'package:r_r_admin/components/common_textfields.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/utils/text.dart';
import 'package:r_r_admin/view/extras/cars/components/delete_dialog.dart';
import 'package:r_r_admin/view_model/brand_place_view_model.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerVal = context.watch<BrandPlaceViewModel>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: const CommonAppbar(title: "PLACES"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueButton,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                children: [
                  const SimpleDialogOption(
                    child: Text("NEW PLACE"),
                  ),
                  SimpleDialogOption(
                    child: Form(
                      key: providerVal.addBrandFormKey,
                      child: TextFormFields(
                        keyType: TextInputType.name,
                        size: size,
                        hintText: "Place Name",
                        controller: providerVal.placeController,
                        isPlace: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<BrandPlaceViewModel>().clearPlacefield();
                        },
                        child: const Text("Cancel"),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          if (providerVal.addBrandFormKey.currentState!
                              .validate()) {
                            CommonSnackBar.snackBar(
                                context: context,
                                data: "Place Created successfully",
                                color: snackBarGreen);
                            Navigator.pop(context);
                            context
                                .read<BrandPlaceViewModel>()
                                .clearPlacefield();
                          }
                        },
                        child: const Text("Create"),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Text(
                  "${index + 1}",
                ),
                title: Text(
                  "CALICUT",
                  style: carText,
                ),
                trailing: IconButton(
                  onPressed: () {
                    DeleteDialog.showDeleteDialog(
                      context,
                      "Place",
                    );
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: snackbarRed,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
