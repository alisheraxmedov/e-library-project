import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/consts/icons.dart';
import 'package:mylibrary/service/provider/provider.dart';
import 'package:provider/provider.dart';
double? width;
class PageRedirector extends StatelessWidget {
  const PageRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
//======================================== BODY ========================================
      body: context.read<ProviderClass>().getSelectedWidget(
            index: context.watch<ProviderClass>().currentIndex,
          ),
//======================================== NAVIGATION BAR ========================================
      bottomNavigationBar: CurvedNavigationBar(
        
        backgroundColor: ConstColor.blue,
        color: ConstColor.lightBlue,
        items: UseIcons.icon,
        onTap: (value) {
          context.read<ProviderClass>().pageIndex(value);
        },
      ),
    );
  }
}
