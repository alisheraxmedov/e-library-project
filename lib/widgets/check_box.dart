import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/service/provider/provider.dart';
import 'package:provider/provider.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: ConstColor.primaryColor,
      activeColor: ConstColor.blue,
      value: context.watch<ProviderClass>().checkValue,
      onChanged: (newBoolValue) {
        context.read<ProviderClass>().changeBoolValue();
      },
      side: const BorderSide(color: ConstColor.blue, width: 1.5),
    );
  }
}
