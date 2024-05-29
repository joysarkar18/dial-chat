import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dial_pad_controller.dart';

class DialPadView extends GetView<DialPadController> {
  const DialPadView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Obx(
            () => Text(
              controller.input.value,
              style: AppTextStyles.roboto24w700(color: context.black),
            ),
          ),
          100.kheightBox,
          _buildDialPad(),
          70.kheightBox,
        ],
      ),
    );
  }

  Widget _buildDialPad() {
    return Column(
      children: [
        _buildDialPadRow(['1', '2 ABC', '3 DEF']),
        5.kheightBox,
        _buildDialPadRow(['4 GHI', '5 JKL', '6 MNO']),
        5.kheightBox,
        _buildDialPadRow(['7 PQRS', '8 TUV', '9 WXYZ']),
        5.kheightBox,
        _buildDialPadRow(['*', '0 +', '#']),
        20.kheightBox,
        _buildDeleteButtonRow(),
      ],
    );
  }

  Widget _buildDialPadRow(List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: labels.map((label) {
        return _buildDialPadButton(label);
      }).toList(),
    );
  }

  Widget _buildDialPadButton(String label) {
    final parts = label.split(' ');
    final digit = parts[0];
    final letters = parts.length > 1 ? parts[1] : '';

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => controller.onPressed(digit),
            child: Container(
              height: 46.kh,
              width: 96.kw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFEFEFEF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    digit,
                    style: AppTextStyles.roboto21w400(
                      color: const Color(0xFF00201C),
                    ),
                  ),
                  if (letters.isNotEmpty) 7.kwidthBox,
                  Text(
                    letters,
                    style: AppTextStyles.roboto11w400(
                      color: const Color(0xFF4A635E),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildDeleteButtonRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Material(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: CommonImageView(
                svgPath: AppSvg.dialPadChatIcon,
              ),
            ),
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: CommonImageView(
                svgPath: AppSvg.dial,
              ),
            ),
          ),
          Material(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: () => controller.deleteLastCharacter(),
                child: CommonImageView(
                  svgPath: AppSvg.delete,
                )),
          ),
        ],
      ),
    );
  }
}
