import 'package:cached_network_image/cached_network_image.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/components/message_input_bar.dart';
import 'package:dial_chat/app/modules/chat/controllers/chat_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:audioplayers/audioplayers.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final currentUserId = Get.arguments[0]["userId"];

    void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
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
              .doc(currentUserId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.currentSender =
                  UserModel.fromJson(snapshot.data!.data()!);
              return InkWell(
                onTap: () {
                  controller.gotoProfilePage(data: snapshot.data!.data()!);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(snapshot
                                        .data!["imageUrl"] ==
                                    null ||
                                snapshot.data!["imageUrl"] == ""
                            ? "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"
                            : snapshot.data!["imageUrl"])),
                    const SizedBox(width: 10),
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
                          "${controller.getStatus(snapshot.data!["lastUpdate"])}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: context.grey),
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.CHAT_CALL, arguments: {
                "callId": "joysarkarcalltest",
                "receiverId": currentUserId,
                'isCaller': true,
              });
            },
            icon: CommonImageView(
              svgPath: "assets/svg/video-svgrepo-com.svg",
              svgColor: context.black,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(Routes.VOICE_CALL, arguments: {
                "callId": "joysarkarcalltest",
                "receiverId": currentUserId,
                'isCaller': true,
              });
            },
            child: CommonImageView(
              svgPath: "assets/svg/phone-rounded-svgrepo-com.svg",
              svgColor: context.black,
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
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                controller: scrollController,
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  final data = message.data() as Map<String, dynamic>;
                  final text = data['text'] as String;
                  final senderId = data['senderId'] as String;
                  final isSender = senderId == currentUserId;

                  Widget messageWidget;
                  if (_isImageMessage(text)) {
                    messageWidget = _buildImageMessage(text, isSender);
                  } else if (_isDocumentMessage(text)) {
                    messageWidget = _buildDocumentMessage(text, isSender);
                  } else if (_isLocationMessage(text)) {
                    messageWidget = _buildLocationMessage(text, isSender);
                  } else if (_isContactMessage(text)) {
                    messageWidget = _buildContactMessage(text, isSender);
                  } else if (_isAudioMessage(text)) {
                    messageWidget = _buildAudioMessage(text, isSender);
                  } else {
                    messageWidget = _buildTextMessage(text, isSender);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: messageWidget,
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

  bool _isImageMessage(String text) {
    return text.startsWith('https://') && text.contains('images');
  }

  bool _isDocumentMessage(String text) {
    return text.startsWith('https://') && text.contains('documents');
  }

  bool _isLocationMessage(String text) {
    return text.contains('www.google.com/maps/');
  }

  bool _isContactMessage(String text) {
    return text.startsWith('Contact: ');
  }

  bool _isAudioMessage(String text) {
    return text.startsWith('https://') && text.contains('.aac');
  }

  Widget _buildTextMessage(String text, bool isSender) {
    return BubbleNormal(
      text: text,
      isSender: isSender,
      color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
    );
  }

  Widget _buildImageMessage(String imageUrl, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Get.to(() => ImageViewer(imageUrl: imageUrl));
        },
        child: Container(
          width: 60.w,
          decoration: BoxDecoration(
            color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: CommonImageView(
            url: imageUrl,
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentMessage(String documentUrl, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.insert_drive_file, size: 50),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(documentUrl);

                await launchUrl(url);
              },
              child: Text(
                'Open Document',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationMessage(String locationMessage, bool isSender) {
    final Uri locationUri = Uri.parse(locationMessage);

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(locationUri)) {
            await launchUrl(locationUri);
          } else {
            Get.snackbar('Error', 'Could not open location');
          }
        },
        child: Container(
          width: 50.w,
          decoration: BoxDecoration(
            color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
              width: 1,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 24, color: Colors.red),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Open Location',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactMessage(String contactMessage, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.contacts, size: 50),
            SizedBox(height: 5),
            Text(contactMessage.split(",")[0]),
            Text("Number : " + contactMessage.split(",")[1]),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioMessage(String audioUrl, bool isSender) {
    final AudioPlayer audioPlayer = AudioPlayer();
    bool isPlaying = false;
    Duration? totalDuration;

    return StatefulBuilder(
      builder: (context, setState) {
        audioPlayer.onDurationChanged.listen((duration) {
          setState(() {
            totalDuration = duration;
          });
        });

        return Align(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 50.w,
            margin: EdgeInsets.only(
                left: isSender ? 0 : 18, right: isSender ? 18 : 0),
            decoration: BoxDecoration(
              color: isSender ? Color(0xff7FD0E4) : Color(0xFFE8E8EE),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      await audioPlayer.setSourceUrl(audioUrl);
                      await audioPlayer.resume();
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                Expanded(
                  child: StreamBuilder<Duration>(
                    stream: audioPlayer.onPositionChanged,
                    builder: (context, snapshot) {
                      final position = snapshot.data ?? Duration.zero;
                      final progress = totalDuration != null
                          ? position.inMilliseconds /
                              totalDuration!.inMilliseconds
                          : 0.0;
                      return LinearProgressIndicator(value: progress);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ImageViewer extends StatelessWidget {
  final String imageUrl;

  const ImageViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
          backgroundDecoration: BoxDecoration(
            color: Colors.black,
          ),
          loadingBuilder: (context, event) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
