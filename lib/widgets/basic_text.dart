import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';

Widget basicText(String text, double size,
    {FontWeight weight = FontWeight.normal, Color color = ConstColor.white}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
  );
}
