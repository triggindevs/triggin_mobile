import 'package:flutter/material.dart';

class TgnColors{
  //primary colors
  static const bgColor = Color(0XFFE5E5E5);
  static const avatarBg = Color(0XFFFFE9EA);
  static const homepageBg = Color(0XFFF5F7FE);
  static const primaryText = Color(0XFFF65C7C);
  static const secondaryText = Color(0XFF011627);
  static const greyText = Color(0XFF818181);

  //Login OTP Txt colors
  static const otpTxt = Color(0XFF7A8692);



  //Homepage txt Colors
  static const homeTxt = Color(0XFF474749);
  static const blueTxt = Color(0XFF2F80ED);
  static const cardBg = Color(0XFFB1EAFD);
  static const cardBgText = Color(0XFF21114C);

//Drawer text colors
  static const  drawerText1= Color(0XFF23385B);
  //Homepage card border also
  static const drawerText2 = Color(0XFFF62A34);

  static const trigginBorder = Color(0XFFE2E2E2);

//Gradient colors

  static const btnGradient1 = Color(0XFFF62A34);
  static const btnGradient2 = Color(0XFF960535);

  static const linearGradientbtns = LinearGradient(
    colors: [
      TgnColors.btnGradient1,
      TgnColors.btnGradient2,
    ],
  );
}