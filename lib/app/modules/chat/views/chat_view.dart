import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
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
          MessageBar(
            messageBarColor: context.chatBoxColor,
            onSend: (message) {
              // This is where you handle sending the message
              print(message);
              // After sending the message, clear the input
            },
            actions: [
              InkWell(
                child: Icon(
                  Icons.add,
                  color: context.black,
                  size: 24,
                ),
                onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
