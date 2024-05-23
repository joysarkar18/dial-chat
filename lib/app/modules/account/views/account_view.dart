import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.accounts,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.kheightBox,
            Text(
              AppStrings.subscriptions,
              style: AppTextStyles.inter14w400(color: context.black),
            ),
            5.kheightBox,
            const Divider(),
            5.kheightBox,
            InkWell(
              onTap: () {},
              child: Text(
                AppStrings.changeNumber,
                style: AppTextStyles.inter14w400(color: context.black),
              ),
            ),
            5.kheightBox,
            const Divider(),
            5.kheightBox,
            Text(
              AppStrings.deleteAccount,
              style: AppTextStyles.inter14w400(color: context.black),
            ),
            5.kheightBox,
            const Divider(),
          ],
        ),
      ),
    );
  }
}
