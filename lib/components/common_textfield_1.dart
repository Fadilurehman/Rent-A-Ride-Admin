import 'package:flutter/material.dart';
import 'package:r_r_admin/utils/colors.dart';

class TextFormFields1 extends StatelessWidget {
  final Size size;
  final String hintText;
  final TextEditingController controller;
  final bool isAdmin;
  final bool isPassword;
  final bool isCarName;
  final bool isCarRent;
  final bool isCarDescription;
  final bool isPlace;
  final bool isBrand;
  final bool isBody;
  final bool isTransmission;
  final bool isFuel;
  final bool isModelNo;
  final bool isImage;
  final TextInputType keyType;
  final int maxLines;
  const TextFormFields1({
    super.key,
    required this.size,
    required this.hintText,
    required this.controller,
    this.isAdmin = false,
    this.isPassword = false,
    this.isBody = false,
    this.isBrand = false,
    this.isCarDescription = false,
    this.isCarName = false,
    this.isCarRent = false,
    this.isFuel = false,
    this.isImage = false,
    this.isModelNo = false,
    this.isPlace = false,
    this.isTransmission = false,
    this.keyType = TextInputType.name,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyType,
      validator: (value) {
        if (isAdmin) {
          if (value == null || value.isEmpty) {
            return "Username is required";
          }
        }
        if (isPassword) {
          if (value == null || value.isEmpty) {
            return "password is required";
          }
        }
        if (isCarName) {
          if (value == null || value.isEmpty) {
            return "Car name is required";
          }
        }
        if (isCarRent) {
          if (value == null || value.isEmpty) {
            return "Car rent is required";
          }
        }
        if (isCarDescription) {
          if (value == null || value.isEmpty) {
            return "Car Desciption is required";
          }
        }
        if (isPlace) {
          if (value == null || value.isEmpty) {
            return "Place is required";
          }
        }
        if (isBrand) {
          if (value == null || value.isEmpty) {
            return "Brand is required";
          }
        }
        if (isBody) {
          if (value == null || value.isEmpty) {
            return "Body is required";
          }
        }
        if (isTransmission) {
          if (value == null || value.isEmpty) {
            return "Transmission is required";
          }
        }
        if (isFuel) {
          if (value == null || value.isEmpty) {
            return "Fuel is required";
          }
        }
        if (isModelNo) {
          if (value == null || value.isEmpty) {
            return "Model Number is required";
          }
        }
        if (isImage) {
          if (value == null || value.isEmpty) {
            return "Image is required";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 233, 234, 239),
        filled: true,
        counterStyle: const TextStyle(color: kwhite),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 52, 54, 55),
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kblack,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
