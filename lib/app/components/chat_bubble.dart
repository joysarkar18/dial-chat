import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.text,
    required this.isCurrentUser,
  });
  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.kw),
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isCurrentUser)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.kw),
                child: CommonImageView(
                  height: 32.kh,
                  width: 32.kw,
                  url:
                      "https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg",
                ),
              ),
            ),
          Row(
            children: [
              if (isCurrentUser)
                Text("12:12 am",
                    style: AppTextStyles.inter12w400(color: context.black)),
              4.kwidthBox,
              Align(
                // align the child within the container
                alignment: isCurrentUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: DecoratedBox(
                  // chat bubble decoration
                  decoration: BoxDecoration(
                    color: isCurrentUser ? Colors.black : context.secondaryBlue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(8),
                        bottomRight: isCurrentUser
                            ? const Radius.circular(0)
                            : const Radius.circular(8),
                        topLeft: isCurrentUser
                            ? const Radius.circular(8)
                            : const Radius.circular(0),
                        topRight: const Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: 60.w,
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color:
                                isCurrentUser ? Colors.white : Colors.black87),
                      ),
                    ),
                  ),
                ),
              ),
              4.kwidthBox,
              if (!isCurrentUser)
                Text(
                  "12:12 am",
                  style: AppTextStyles.inter12w400(color: context.black),
                ),
            ],
          ),
          if (isCurrentUser)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.kw),
                child: CommonImageView(
                  height: 32.kh,
                  width: 32.kw,
                  url:
                      "https://img.freepik.com/free-photo/front-view-young-beautiful-female-white-shirt-posing-with-surprised-expression_140725-17256.jpg",
                ),
              ),
            ),
        ],
      ),
    );
  }
}
