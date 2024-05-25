import 'package:dial_chat/app/components/chat_bubble.dart';
import 'package:dial_chat/app/components/custom_textfield.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    // Scroll to bottom when the keyboard is shown
    void scrollToBottom() {
      print("hiiii");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 550);
        }
      });
    }  

    scrollToBottom();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Joy Sarkar",
          style: AppTextStyles.inter14w400(color: context.black),
        ),
        centerTitle: true,
      ),
      body: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          if (isKeyboardVisible) {
            scrollToBottom();
          }
          return Stack(
            children: [
              SizedBox(
                height: 100.h - 100.kh - AppBar().preferredSize.height,
                width: 100.w,
                child: ListView(
                  controller: scrollController,
                  children: [
                    const ChatBubble(
                      text: 'How was the concert?',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text: 'Awesome! Next time you gotta come as well!',
                      isCurrentUser: true,
                    ),
                    const ChatBubble(
                      text: 'Ok, when is the next date?',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text: 'They\'re playing on the 20th of November',
                      isCurrentUser: true,
                    ),
                    const ChatBubble(
                      text: 'Let\'s do it!',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text: 'How was the concert?',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text: 'Awesome! Next time you gotta come as well!',
                      isCurrentUser: true,
                    ),
                    const ChatBubble(
                      text: 'Ok, when is the next date?',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text: 'They\'re playing on the 20th of November',
                      isCurrentUser: true,
                    ),
                    const ChatBubble(
                      text: 'Let\'s do it!',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text:
                          'How was the concert? adasd asd aowruoirwr wiuoer afhakdh qoqeuqew ahd',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text:
                          'Awesome! Next time you gotta come as well! asdad asdjkhad askj adsoahdskjd asd oawiakjsdh adsjad',
                      isCurrentUser: true,
                    ),
                    const ChatBubble(
                      text: 'Ok, when is the next date?',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text: 'They\'re playing on the 20th of November',
                      isCurrentUser: true,
                    ),
                    const ChatBubble(
                      text: 'Let\'s do it!',
                      isCurrentUser: false,
                    ),
                    const ChatBubble(
                      text:
                          'Awesome! Next time you gotta come as well! asdad asdjkhad askj adsoahdskjd asd oawiakjsdh adsjad',
                      isCurrentUser: true,
                    ),
                    70.kheightBox,
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 100.w,
                  margin:
                      EdgeInsets.only(left: 16.kw, right: 16.kw, bottom: 16.kh),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: context.grey,
                    ),
                    borderRadius: BorderRadius.circular(8.kw),
                  ),
                  child: CustomTextField(
                    fillColor: Colors.white,
                    hintText: "Write message",
                    suffixIcon: Icons.send,
                    iconColor: context.secondaryBlue,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
