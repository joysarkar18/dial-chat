import 'dart:io';

import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/name_email_controller.dart';

class NameEmailView extends GetView<NameEmailController> {
  const NameEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              120.kheightBox,
              Center(
                child: GestureDetector(
                  onTap: controller.pickImage,
                  child: Container(
                    height: 70.kh,
                    width: 70.kh,
                    decoration: BoxDecoration(
                      image: controller.pickedImagePath.value.isNotEmpty
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                  File(controller.pickedImagePath.value)),
                            )
                          : controller.imageUrl.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(controller.imageUrl.value),
                                )
                              : null,
                      shape: BoxShape.circle,
                      color: context.lightGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: controller.imageUrl.isEmpty &&
                              controller.pickedImagePath.value.isEmpty
                          ? CommonImageView(
                              imagePath: AppSvg.addPhotoCameraIcon,
                            )
                          : SizedBox(),
                    ),
                  ),
                ),
              ),
              30.kheightBox,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
                child: Container(
                  height: 40.kh,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .5,
                        color: context.grey,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppStrings.name,
                      hintStyle: AppTextStyles.rubik12w400(
                        color: context.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  height: 40.kh,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .5,
                        color: context.grey,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppStrings.email,
                      hintStyle: AppTextStyles.rubik12w400(
                        color: context.grey,
                      ),
                    ),
                  ),
                ),
              ),
              55.kheightBox,
              MyButton(
                  text: AppStrings.continueButton,
                  bgColor: context.secondaryBlue,
                  textColor: context.white,
                  height: 50.kh,
                  width: 180.kw,
                  onTap: controller.uploadDataToFirebase)
            ],
          ),
        ),
      ),
    );
  }
}
