import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/components/message_input_bar.dart';
import 'package:dial_chat/app/modules/chat/controllers/chat_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart'; // Import CallsController

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final currentUserId = Get.arguments[0]["user"].uid;

    void scrollToBottom() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.minScrollExtent,
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
        title: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(Get.arguments[0]["user"].uid)
              .snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(snapshot
                                          .data!["imageUrl"] ==
                                      null ||
                                  snapshot.data!["imageUrl"] == ""
                              ? "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"
                              : snapshot.data!["imageUrl"])),
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
                            snapshot.data!["online"] ? "online" : "offline",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: context.grey),
                          ),
                        ],
                      )
                    ],
                  )
                : SizedBox();
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.CHAT_CALL, arguments: {
                "callId": "joysarkarcalltest",
                "receiverId": Get.arguments[0]["user"].uid,
                'isCaller': true,
              });
            },
            icon: Icon(Icons.videocam),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.VOICE_CALL, arguments: {
                "callId": "joysarkarcalltest",
                "receiverId": Get.arguments[0]["user"].uid,
                'isCaller': true,
              });
            },
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

                  return BubbleNormal(
                    text: message['text'],
                    isSender: isSender,
                    color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
                  );
                },
              );
            }),
          ),
          30.kheightBox,
          MessageInputBar(
            isGroup: false,
            onSend: () {
              controller.sendMessage(controller.messageController.text);
              scrollToBottom();
            },
          ),
        ],
      ),
    );
  }
}
