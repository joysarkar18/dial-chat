import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/components/message_input_bar.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Scroll to bottom when the keyboard is shown
    void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 550);
        }
      });
    }

    scrollToBottom();

    final now = DateTime.now();
    return Scaffold(
      backgroundColor: context.chatBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Joy Sarkar",
                  style: AppTextStyles.inter14w400(color: context.black),
                ),
                Text(
                  "Online",
                  style: AppTextStyles.inter12w300(color: context.grey),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          // InkWell(
          //   onTap: () {},
          //   child: CommonImageView(
          //     svgPath: AppSvg.appBarCameraLogo,
          //     height: 28,
          //     width: 28,
          //   ),
          // ),
          // 13.kwidthBox,
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
          InkWell(
            onTap: () => Get.toNamed(Routes.DIALING),
            child: CommonImageView(
              svgPath: AppSvg.callIcon,
              height: 28,
              width: 28,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'report',
                child: Text('Report'),
              ),
              const PopupMenuItem<String>(
                value: 'block',
                child: Text('Block'),
              ),
              const PopupMenuItem<String>(
                value: 'media_links_files',
                child: Text('Media, links and files'),
              ),
              const PopupMenuItem<String>(
                value: 'mute_notifications',
                child: Text('Mute notifications'),
              ),
              const PopupMenuItem<String>(
                value: 'disappearing_messages',
                child: Text('Disappearing messages'),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: <Widget>[
                DateChip(
                  date: now.subtract(Duration(days: 2)),
                ),
                BubbleNormal(
                  text: 'Hey, how have you been?',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'I\'ve been good, just busy with work. How about you?',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                ),
                BubbleNormal(
                  text: 'Same here, lots of projects to complete.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'Have you seen the latest movie that came out?',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                BubbleNormal(
                  text: 'Yes, it was amazing! The storyline was so gripping.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text:
                      'I totally agree! We should watch the next one together.',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                BubbleNormal(
                  text: 'Definitely, let\'s plan for it.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'How about this weekend?',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                BubbleNormal(
                  text: 'Sounds perfect! See you then.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                DateChip(
                  date: now.subtract(Duration(days: 1)),
                ),
                BubbleNormal(
                  text: 'Hey, did you finish the report?',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                BubbleNormal(
                  text: 'Yes, I just sent it over to you. Check your email.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'Got it, thanks! It looks great.',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                BubbleNormal(
                  text:
                      'No problem! Let me know if there’s anything else you need.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'Sure, will do. Have a good day!',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                DateChip(
                  date: now,
                ),
                BubbleNormal(
                  text: 'Hey, are you joining the team meeting later?',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'Yes, I’ll be there. Do you have the agenda?',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                BubbleNormal(
                  text: 'Yes, I’ll forward it to you now.',
                  isSender: false,
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                BubbleNormal(
                  text: 'Great, thanks!',
                  isSender: true,
                  color: Color(0xFF048A93),
                  tail: true,
                  sent: true,
                  delivered: true,
                ),
                90.kheightBox,
              ],
            ),
          ),
          const MessageInputBar(),
          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     width: 100.w,
          //     height: 70.kh,
          //     color: Colors.white,
          //     // child: MessageBar(),
          //     child: Padding(
          //       padding: const EdgeInsets.all(2.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           5.kwidthBox,
          //           Container(
          //               decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   border: Border.all(width: 1)),
          //               child: const Icon(
          //                 Icons.add,
          //                 size: 20,
          //               )),
          //           Expanded(
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Stack(
          //                 children: [
          //                   Container(
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(30),
          //                       color: context.lightGrey_2,
          //                     ),
          //                     child: Padding(
          //                       padding: EdgeInsets.symmetric(horizontal: 10.0),
          //                       child: Column(
          //                         children: [
          //                           Expanded(
          //                             child: TextFormField(
          //                               maxLines: null, // Set this
          //                               expands: true, // and this
          //                               keyboardType: TextInputType.multiline,
          //                               decoration: InputDecoration(
          //                                   border: InputBorder.none,
          //                                   hintText: 'Message..'),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   Positioned(
          //                     right: 10,
          //                     top: 10,
          //                     child: Icon(Icons.abc),
          //                   ),
          //                   Positioned(
          //                     right: 40,
          //                     top: 10,
          //                     child: Icon(Icons.abc),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           const Icon(Icons.send),
          //           10.kwidthBox,
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // MessageBar(
          //   messageBarColor: context.chatBoxColor,
          //   onSend: (message) {
          //     // This is where you handle sending the message
          //     print(message);
          //     // After sending the message, clear the input
          //   },
          //   actions: [
          //     InkWell(
          //       child: Icon(
          //         Icons.add,
          //         color: context.black,
          //         size: 24,
          //       ),
          //       onTap: () {},
          //     ),
          //     // Padding(
          //     //   padding: EdgeInsets.only(left: 8, right: 8),
          //     //   child: InkWell(
          //     //     child: Icon(
          //     //       Icons.camera_alt,
          //     //       color: Colors.green,
          //     //       size: 24,
          //     //     ),
          //     //     onTap: () {},
          //     //   ),
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
