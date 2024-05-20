import 'package:dial_chat/app/utils/color_util.dart';
import 'package:flutter/material.dart';

double _calculateLetterSpacing(double fontSize, double percentage) {
  // Calculate the letter spacing based on the percentage of the font size
  return (fontSize * percentage) / 100.0;
}

class AppTextStyles {
  //Regular Font
  static TextStyle uiRegBody({Color? color = Colors.black}) {
    return TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: color,
    );
  }

  static TextStyle termsText({Color? color = Colors.black}) {
    return TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: color,
    );
  }

  static TextStyle buttonText({Color? color = AppColors.black}) {
    return TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w600,
      fontSize: 15,
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
