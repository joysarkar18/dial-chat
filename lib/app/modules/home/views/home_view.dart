import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: context.secondaryBlue,
              borderRadius: BorderRadius.circular(12)),
          child: IconButton(
              icon: CommonImageView(
                svgPath: AppSvg.chatButtonIcon,
              ),
              onPressed: () {
                Get.toNamed(Routes.DIAL_PAD);
              }),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 16.kw,
            right: 16.kw,
          ),
          child: Obx(
            () => controller.contacts.isEmpty
                ? Center(
                    child: Text("No contacts avaiable"),
                  )
                : ListView.builder(
                    itemCount: controller.contacts.value.length,
                    itemBuilder: (context, index) => Container(
                      height: 70.kh,
                      width: 100.w,
                      padding: EdgeInsets.symmetric(vertical: 5.kh),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.CHAT);
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.kh),
                              child: CommonImageView(
                                height: 50.kh,
                                width: 50.kh,
                                fit: BoxFit.cover,
                                url:
                                    "https://variety.com/wp-content/uploads/2024/02/Eminem.jpg",
                              ),
                            ),
                            20.kwidthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.contacts.value[index].displayName!,
                                  style: AppTextStyles.inter14w600(
                                      color: context.black),
                                ),
                                3.kheightBox,
                                Text(
                                  "Lets meet up soon",
                                  style: AppTextStyles.inter12w300(
                                      color: context.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 18.kh),
                                  child: Text(
                                    "10:22",
                                    style: AppTextStyles.inter12w300(
                                        color: context.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ));
  }
}
