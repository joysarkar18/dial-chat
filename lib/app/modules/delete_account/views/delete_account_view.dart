import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/components/dropdown.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.deleteAccount,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.kheightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.deletingYourAccountWillDeleteYourData,
                    style: AppTextStyles.rubik12w400(color: context.black),
                  ),
                  Text(
                    AppStrings.includdingPurchasesMadeCredit,
                    style: AppTextStyles.rubik12w400(color: context.black),
                  ),
                  Text(
                    AppStrings.willBeDeleteYourBackupDisconnectYou,
                    style: AppTextStyles.rubik12w400(color: context.black),
                  ),
                  Text(
                    AppStrings.fromAllDevices,
                    style: AppTextStyles.rubik12w400(color: context.black),
                  ),
                ],
              ),
            ),
            5.kheightBox,
            const Divider(),
            10.kheightBox,
            Text(
              AppStrings.changeYourNumberInstead,
              style: AppTextStyles.rubik12w400(color: context.secondaryBlue),
            ),
            10.kheightBox,
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                40.kheightBox,
                const Center(
                  child: CustomDropdown(),
                ),
                60.kheightBox,
                SizedBox(
                  width: 250.kw,
                  child: Row(
                    children: [
                      Container(
                        width: 30.kw,
                        height: 20.kh,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.2, color: context.grey))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '+27',
                              hintStyle: AppTextStyles.rubik15w400(
                                  color: context.grey)),
                        ),
                      ),
                      40.kwidthBox,
                      Expanded(
                        child: Container(
                          // width: 70.kw,
                          height: 20.kh,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.2, color: context.grey))),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: AppTextStyles.rubik15w400(
                                    color: context.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                60.kheightBox,
                MyButton(
                  text: AppStrings.deleteAccount,
                  bgColor: context.secondaryBlue,
                  textColor: context.white,
                  height: 50.kh,
                  width: 180.kw,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
