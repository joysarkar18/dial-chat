import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/internationalplans_controller.dart';

class InternationalplansView extends GetView<InternationalplansController> {
  const InternationalplansView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.kh,
              width: 140.kw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: context.lightGrey_2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      AppStrings.r18,
                      style: AppTextStyles.inter24w700(color: context.black),
                    ),
                  ),
                  Text(
                    AppStrings.min30,
                    style: AppTextStyles.inter24w400(color: context.black),
                  ),
                  5.kheightBox,
                  Text(
                    AppStrings.forDays30,
                    style: AppTextStyles.inter16w400(color: context.black),
                  ),
                  20.kheightBox,
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 35.kh,
                        width: 75.kw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: context.secondaryBlue,
                        ),
                        child: Center(
                          child: Text(
                            AppStrings.buyNow,
                            style:
                                AppTextStyles.inter12w500(color: context.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            30.kwidthBox,
            Container(
              height: 200.kh,
              width: 140.kw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: context.lightGrey_2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      AppStrings.r18,
                      style: AppTextStyles.inter24w700(color: context.black),
                    ),
                  ),
                  Text(
                    AppStrings.min30,
                    style: AppTextStyles.inter24w400(color: context.black),
                  ),
                  5.kheightBox,
                  Text(
                    AppStrings.forDays30,
                    style: AppTextStyles.inter16w400(color: context.black),
                  ),
                  20.kheightBox,
                  Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 35.kh,
                        width: 75.kw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: context.secondaryBlue,
                        ),
                        child: Center(
                          child: Text(
                            AppStrings.buyNow,
                            style:
                                AppTextStyles.inter12w500(color: context.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
