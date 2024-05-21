import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  //Regular Font
  static TextStyle rubik24w400({required Color color}) {
    return TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w400,
      fontSize: 24.ksp,
      color: color,
    );
  }

  static TextStyle rubik11w400({required Color color}) {
    return TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w400,
      fontSize: 11.ksp,
      color: color,
    );
  }

  static TextStyle rubik15w600({required Color color}) {
    return TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w600,
      fontSize: 15.ksp,
      color: color,
    );
  }

  // static TextStyle uiRegHeader2({Color color = Colors.black}) {
  //   return TextStyle(
  //     fontFamily: "Inter",
  //     fontWeight: FontWeight.w400,
  //     height: 20,
  //     color: color,
  //   );
  // }
}
