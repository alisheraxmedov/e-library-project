import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/consts/icons.dart';
import 'package:mylibrary/service/provider/provider.dart';
import 'package:provider/provider.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: ConstColor.blue,
      color: ConstColor.lightBlue,
      items: UseIcons.icon,
      index: context.watch<ProviderClass>().currentIndex,
      onTap: (value) {
        // getSelectedWidget(index: value)
      },
    );
  }
  
}
//https://youtu.be/gCjl6KfRhd8