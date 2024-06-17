import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:dial_chat/app/components/message_input_bar.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_chat_controller.dart';

class GroupChatView extends GetView<GroupChatController> {
  const GroupChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }

    return Scaffold(
      backgroundColor: context.chatBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        leadingWidth: 30,
        title: Row(
          children: [
            Get.arguments[0]["groupImage"].toString().isEmpty
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: context.secondaryBlue, shape: BoxShape.circle),
                    child: Center(
                      child: Icon(Icons.group),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage:
                        NetworkImage(Get.arguments[0]["groupImage"])),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Get.arguments[0]["name"],
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: context.black),
                ),
                Text(
                  "",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: context.grey),
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.CHAT_CALL),
            child: Icon(Icons.call),
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
            child: Obx(() {
              return ListView.builder(
                controller: scrollController,
                reverse: true, // To start scrolling from bottom
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message =
                      controller.messages[index].data() as Map<String, dynamic>;
                  final isSender = message['senderId'] == currentUserId;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isSender) Text("Joy Sarkar"),
                      BubbleNormal(
                        text: message['text'],
                        isSender: isSender,
                        color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
          30.kheightBox,
          MessageInputBar(
            isGroup: true,
            onSend: () {
              Get.find<GroupChatController>().sendMessage(
                  Get.find<GroupChatController>().messageController.text);
              scrollToBottom();
            },
          ),
        ],
      ),
    );
  }
}
