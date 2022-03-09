import 'package:flutter/material.dart';
import 'package:triggin_app/design_files/colors.dart';

class CirGradBtn extends StatelessWidget {
  const CirGradBtn({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Material(
      elevation: 4,
      shape: const CircleBorder(),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, gradient: TgnColors.linearGradientbtns),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}