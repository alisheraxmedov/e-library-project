import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';

Widget formField({
  required TextEditingController controller,
  required double screenWidth,
}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(
      color: ConstColor.lightBlue,
      fontSize: screenWidth * 0.03,
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(screenWidth * 0),
        borderSide: const BorderSide(color: ConstColor.white,width: 4),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please, fill in the field";
      }
      return null;
    },
  );
}
