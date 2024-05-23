import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

class MyDialogBox extends StatelessWidget {
  final String title;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  const MyDialogBox(
      {super.key,
      required this.title,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.white,
      title: Text(
        title,
        style: AppTextStyles.inter14w400(color: context.black),
      ),
      content: SizedBox(
        height: 100.kh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CustomCheckBox(),
                5.kwidthBox,
                Text(option1,
                    style: AppTextStyles.inter11w400(color: context.black)),
              ],
            ),
            4.kheightBox,
            Row(
              children: [
                const CustomCheckBox(),
                5.kwidthBox,
                Text(option2,
                    style: AppTextStyles.inter11w400(color: context.black)),
              ],
            ),
            4.kheightBox,
            Row(
              children: [
                const CustomCheckBox(),
                5.kwidthBox,
                Text(option3,
                    style: AppTextStyles.inter11w400(color: context.black)),
              ],
            ),
            4.kheightBox,
            Row(
              children: [
                const CustomCheckBox(),
                5.kwidthBox,
                Text(option4,
                    style: AppTextStyles.inter11w400(color: context.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
