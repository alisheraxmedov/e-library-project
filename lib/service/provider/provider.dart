import 'package:flutter/material.dart';
import 'package:mylibrary/consts/colors.dart';
import 'package:mylibrary/screens/pages/add.dart';
import 'package:mylibrary/screens/pages/book.dart';
import 'package:mylibrary/screens/pages/buy_shop.dart';
import 'package:mylibrary/screens/pages/home.dart';
import 'package:mylibrary/screens/pages/more.dart';

class ProviderClass extends ChangeNotifier {
//================= Password visible or visible_off =================
  bool isVisible = true;
  void changeVisible(){
    isVisible = !isVisible;
    notifyListeners();    
  }
//================= Navigator Page =================
  int currentIndex = 0;
  void pageIndex(int index){
    currentIndex = index;
    notifyListeners();
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch (index) {
      case 0:
        widget = const Home();
      case 1:
        widget = const Book();
      case 2:
        widget =  Add();
      case 3:
        widget = const BuyShop();
      case 4:
        widget = const More();
        break;
      default: return const Home();
    }
    return widget;
  }
//================= Change category Color =================
  Color color1 = ConstColor.lightBlue;
  Color color2 = ConstColor.primaryColor;
  Color color3 = ConstColor.primaryColor;
  Color conatinerBlue = ConstColor.lightBlue;
  Color conatinerPrimary = ConstColor.primaryColor;
  int containerIndex = 0;
  void changeColor(int number){
    if (number==1) {
      color1 = ConstColor.lightBlue;
      color2 = ConstColor.primaryColor;
      color3 = ConstColor.primaryColor;
      containerIndex = 0;
    }else if(number==2){
      color2 = ConstColor.lightBlue;
      color1 = ConstColor.primaryColor;
      color3 = ConstColor.primaryColor;
      containerIndex = 1;
    } 
    else if(number==3){
      color3 = ConstColor.lightBlue;
      color2 = ConstColor.primaryColor;
      color1 = ConstColor.primaryColor;
      containerIndex = 2;
    } 
    else {
      color1 = ConstColor.lightBlue;
      color2 = ConstColor.primaryColor;
      color3 = ConstColor.primaryColor;
      containerIndex = 0;
    }
    notifyListeners();
  }

//============== CheckBox value ===============
bool checkValue = false;
void changeBoolValue(){
  checkValue = !checkValue;
  notifyListeners();
}
}