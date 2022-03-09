
//Business Type class
import 'package:flutter/cupertino.dart';

class BsListData{
  final String bstTitle;
  final String bstRoute;
  final String bstIcon;
  bool isSelected=false;

  BsListData({ this.bstTitle, this.bstRoute,this.bstIcon});

}

//Drawer or Navbar class
class Menu{
  final String dTitle;
  final String droute;
  final Icon dicon0;
  final Icon dicon1;
  bool isSelected=false;

  Menu({ this.dTitle,  this.droute, this.dicon0, this.dicon1});

}

//Homepage category class

class HomeItems{
  final String svgIcon;
  final String cTitle;
  final String cRoute;

  HomeItems({ this.svgIcon, this.cTitle, this.cRoute});
}
