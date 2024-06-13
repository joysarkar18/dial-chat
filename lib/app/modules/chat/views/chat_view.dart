import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:dial_chat/app/components/message_input_bar.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Scroll to bottom when the keyboard is shown or new message added
    void scrollToBottom() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }

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
        leadingWidth: 20,
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
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: context.black),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: context.grey),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
            // Replace with your video icon
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.CHAT_CALL),
            child: Icon(Icons.call),
            // Replace with your call icon
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              reverse: true, // To start scrolling from bottom

              child: Column(
                children: <Widget>[
                  DateChip(date: now.subtract(Duration(days: 2))),
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
                    text:
                        'I\'ve been good, just busy with work. How about you?',
                    isSender: true,
                    color: Color(0xff7FD0E4),
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
                    color: Color(0xff7FD0E4),
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
                    color: Color(0xff7FD0E4),
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
                    color: Color(0xff7FD0E4),
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
                  DateChip(date: now.subtract(Duration(days: 1))),
                  BubbleNormal(
                    text: 'Hey, did you finish the report?',
                    isSender: true,
                    color: Color(0xff7FD0E4),
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
                    color: Color(0xff7FD0E4),
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
                    color: Color(0xff7FD0E4),
                    tail: true,
                    sent: true,
                    delivered: true,
                  ),
                  DateChip(date: now),
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
                    color: Color(0xff7FD0E4),
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
                    color: Color(0xff7FD0E4),
                    tail: true,
                    sent: true,
                    delivered: true,
                  ),
                ],
              ),
            ),
          ),
          MessageInputBar(),
        ],
      ),
    );
  }
}
