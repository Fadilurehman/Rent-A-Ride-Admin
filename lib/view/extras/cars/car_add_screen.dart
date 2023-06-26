import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_r_admin/components/common_appbar.dart';
import 'package:r_r_admin/components/common_elevated.dart';
import 'package:r_r_admin/components/common_textfields.dart';
import 'package:r_r_admin/components/space.dart';
import 'package:r_r_admin/utils/colors.dart';
import 'package:r_r_admin/view_model/car_add_view_model.dart';

class CarAddScreen extends StatelessWidget {
  const CarAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final providerVal = context.watch<CarAddViewModel>();
    return Scaffold(
      // APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: CommonAppbar(
          title: "ADD CARS",
          widget: IconButton(
            onPressed: () {
              if (providerVal.addCarFormKey.currentState!.validate() &&
                  providerVal.carImage != null) {
                providerVal.getAddCarStatus(context);
              }
            },
            icon: const Icon(Icons.save),
          ),
        ),
      ),
      body: providerVal.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Form(
                  key: providerVal.addCarFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await context.read<CarAddViewModel>().pickImage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: providerVal.carImage == null
                                    ? Border.all(
                                        color: Colors.red,
                                        width: 3,
                                      )
                                    : Border.all(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                borderRadius: BorderRadius.circular(7)),
                            height: size.width * 0.5,
                            width: double.infinity,
                            child: providerVal.carImage == null
                                ? const Center(
                                    child: Icon(Icons.camera_alt),
                                  )
                                : Image.file(
                                    providerVal.carImage!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.name,
                          size: size,
                          hintText: "Car Name",
                          controller: providerVal.nameController,
                          isCarName: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.number,
                          size: size,
                          hintText: "Car Rent Amount",
                          controller: providerVal.rentController,
                          isCarRent: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          maxLines: 4,
                          keyType: TextInputType.multiline,
                          size: size,
                          hintText: "Car Description",
                          controller: providerVal.descrptnController,
                          isCarDescription: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.name,
                          size: size,
                          hintText: "Car Place",
                          controller: providerVal.placeController,
                          isPlace: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        // TextFormFields(
                        //   keyType: TextInputType.name,
                        //   size: size,
                        //   hintText: "Car Brand",
                        //   controller: providerVal.brandController,
                        //   isBrand: true,
                        // ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.name,
                          size: size,
                          hintText: "Car Body",
                          controller: providerVal.bodyController,
                          isBody: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.name,
                          size: size,
                          hintText: "Car Transmission",
                          controller: providerVal.transmissionController,
                          isTransmission: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.name,
                          size: size,
                          hintText: "Car Fuel",
                          controller: providerVal.fuelController,
                          isFuel: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        TextFormFields(
                          keyType: TextInputType.number,
                          size: size,
                          hintText: "Car Model Number",
                          controller: providerVal.modelController,
                          isModelNo: true,
                        ),
                        const SpaceWH(
                          height: 20,
                        ),
                        CommonElevated(
                            onTap: () {
                              if (providerVal.addCarFormKey.currentState!
                                      .validate() &&
                                  providerVal.carImage != null) {
                                providerVal.getAddCarStatus(context);
                              }
                            },
                            color: blueButton,
                            child: const Text("SAVE")),
                        const SpaceWH(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
