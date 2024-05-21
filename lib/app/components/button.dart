import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double? width;
  final double height;
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback onTap;
  const MyButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      this.width,
      required this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.rubik15w600(color: textColor),
          ),
        ),
      ),
    );
  }
}
