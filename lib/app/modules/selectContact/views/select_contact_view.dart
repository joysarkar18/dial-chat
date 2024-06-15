import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_contact_controller.dart';

class SelectContactView extends GetView<SelectContactController> {
  const SelectContactView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Contact',
            style: AppTextStyles.inter15w500(color: context.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: controller.getAvailableUserData,
                icon: Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16.kw, right: 16.kw, top: 10.kh),
          child: Obx(() => Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.secondaryBlue),
                        child: const Center(
                          child: Icon(
                            Icons.group_add_sharp,
                            size: 20,
                          ),
                        ),
                      ),
                      20.kwidthBox,
                      Text(
                        AppStrings.newGroup,
                        style: AppTextStyles.rubik15w600(color: context.black),
                      ),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_right_sharp)
                    ],
                  ),
                  20.kheightBox,
                  const Row(
                    children: [
                      Text(AppStrings.contactsOnDialChat),
                    ],
                  ),
                  20.kheightBox,
                  ...controller.availableUsers.map((element) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: () {
                            controller.startChat(
                                user: element.userModel,
                                name: element.contact.givenName!);
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CommonImageView(
                                  height: 40,
                                  width: 40,
                                  url: element.userModel.imageUrl,
                                ),
                              ),
                              15.kwidthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    element.contact.givenName == null
                                        ? element.userModel.name
                                        : element.contact.givenName!,
                                    style: AppTextStyles.inter15w500(
                                        color: context.black),
                                  ),
                                  Text(
                                    AppStrings.startConversion,
                                    style: AppTextStyles.inter12w400(
                                        color: context.grey),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  20.kheightBox,
                  const Row(
                    children: [
                      Text(AppStrings.inviteToDialChat),
                    ],
                  ),
                  20.kheightBox,
                  ...controller.unavailableContacts.map((element) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CommonImageView(
                                height: 40,
                                width: 40,
                                imagePath: AppSvg.defaultUser,
                              ),
                            ),
                            15.kwidthBox,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  element.givenName!,
                                  style: AppTextStyles.inter15w500(
                                      color: context.black),
                                ),
                                Text(
                                  AppStrings.inviteToDialChat,
                                  style: AppTextStyles.inter12w400(
                                      color: context.grey),
                                )
                              ],
                            ),
                            const Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.invite,
                                  style: AppTextStyles.inter13w400(
                                      color: context.secondaryBlue),
                                ))
                          ],
                        ),
                      ))
                ],
              )),
        ));
  }
}
