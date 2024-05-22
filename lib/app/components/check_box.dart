import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Container(
          width: 20.kw,
          height: 20.kh,
          decoration: BoxDecoration(
            color: isChecked ? context.secondaryBlue : context.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: context.lightGrey,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
