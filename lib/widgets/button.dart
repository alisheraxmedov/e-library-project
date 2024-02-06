import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/screens/redirector.dart';
import 'package:mylibrary/widgets/basic_text.dart';
import 'package:mylibrary/widgets/check_box.dart';

Widget myButton({
  required void Function()? onPressed,
  required String text,
  double fontSize = 14.0,
  required Color buttonColor,
}) {
  return Container(
    padding: EdgeInsets.all(width! * 0.02),
    decoration: BoxDecoration(
      color: ConstColor.primaryColor,
      border: Border.all(
        width: 1,
        color: ConstColor.blue,
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const CheckBoxWidget(),
              basicText("Private", width! * 0.04, color: ConstColor.blue),
            ],
          ),
        ),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width! * 0),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: ConstColor.primaryColor,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
