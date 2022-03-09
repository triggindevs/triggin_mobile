import 'package:flutter/material.dart';
import 'package:triggin_app/design_files/colors.dart';

class TgnTxtStyles{

  static TextStyle getCWSTxt({ double fontSize, FontWeight weight, Color color}){
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      fontWeight: weight,
      color: color,
    );
  }
  static TextStyle getTxtStyle({ double fontSize}){
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: TgnColors.primaryText,
    );
  }
//Drawer txt styles
  static TextStyle getDrawerTxt({ double fontSize, bool click}){
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: click?TgnColors.drawerText2:TgnColors.drawerText1,
    );
  }

  //Homepage txt styles
  static TextStyle gethomeTxt({ double fontSize, FontWeight weight}){
    return TextStyle(
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      fontWeight: weight,
      color: TgnColors.homeTxt,
    );
  }

//Business and Category Type text
  static const tileTxtStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );


  static const bodyText3 = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: TgnColors.secondaryText,
  );

}