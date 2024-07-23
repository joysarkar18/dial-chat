import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/modules/chat/controllers/chat_controller.dart';
import 'package:dial_chat/app/modules/groupChat/controllers/group_chat_controller.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dial_chat/app/utils/color_util.dart';

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({Key? key, required this.onSend, required this.isGroup})
      : super(key: key);
  final Function onSend;
  final bool isGroup;

  @override
  _MessageInputBarState createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  final FocusNode _focusNode = FocusNode();
  double _containerHeight = 50.0; // Initial height
  final double _maxContainerHeight = 150.0; // Maximum height to limit expansion
  bool _isFocused = false;
  bool _showOptions = false;
  // State variable to toggle options

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    if (widget.isGroup) {
      Get.find<GroupChatController>().messageController.dispose();
    } else {
      Get.find<ChatController>().messageController.dispose();
    }

    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      _showOptions = false; // Hide options when focus changes
    });
  }

  void _updateContainerHeight() {
    final textHeight = _calculateTextHeight();
    setState(() {
      _containerHeight = textHeight + 20; // Adjust with padding/margins
      if (_containerHeight > _maxContainerHeight) {
        _containerHeight = _maxContainerHeight; // Limit the maximum height
      }
    });
  }

  double _calculateTextHeight() {
    final span = TextSpan(
      text: widget.isGroup
          ? Get.find<GroupChatController>().messageController.text
          : Get.find<ChatController>().messageController.text,
      style: const TextStyle(fontSize: 16.0),
    );
    final tp = TextPainter(
      text: span,
      maxLines: null,
      textDirection: TextDirection.ltr,
    );
    tp.layout(maxWidth: MediaQuery.of(context).size.width - 120);
    return tp.size.height;
  }

  void toggleOptions() {
    setState(() {
      _showOptions = !_showOptions;
      if (_focusNode.hasFocus) {
        _focusNode.unfocus(); // Unfocus if options are toggled
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: MediaQuery.of(context).size.width,
          height: _containerHeight + 30,
          color: context.chatBoxColor,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                5.kwidthBox,
                InkWell(
                  onTap: toggleOptions,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: context.sendIcon),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: context.sendIcon,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: context.lightGrey_2,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 62.w,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, left: 20.0),
                                  child: TextField(
                                    focusNode: _focusNode,
                                    controller: widget.isGroup
                                        ? Get.find<GroupChatController>()
                                            .messageController
                                        : Get.find<ChatController>()
                                            .messageController,
                                    maxLines: null,
                                    onChanged: (text) =>
                                        _updateContainerHeight(),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Message..',
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.find<ChatController>()
                                              .sendImage();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 16.kw),
                                          child: Image.asset(
                                            'assets/svg/gallery.png',
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                      10.kwidthBox,
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_isFocused) {
                      // send action
                    } else {
                      // mic action
                    }
                  },
                  child: GestureDetector(
                    onLongPress: () async {
                      await Get.find<ChatController>().startRecording();
                    },
                    onLongPressUp: () async {
                      await Get.find<ChatController>().stopRecording();
                    },
                    onTap: () {
                      print("onSend click");
                      widget.onSend();
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          color: context.sendBackground,
                          shape: BoxShape.circle),
                      child: Icon(
                        _isFocused ? Icons.send : Icons.mic,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                10.kwidthBox,
              ],
            ),
          ),
        ),
        if (_showOptions)
          Container(
            height: 130,
            color: context.lightGrey_2,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                IconButton(
                  onPressed: () {
                    Get.find<ChatController>().sendImage();
                  },
                  icon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: context.lightGrey_2),
                        child: Center(
                          child: Image.asset(
                            'assets/svg/gallery.png',
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Photos',
                        style: AppTextStyles.inter12w400(color: context.black),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.find<ChatController>().sendLocation();
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: context.lightGrey_2),
                        child: Center(
                          child: Icon(
                            Icons.my_location_sharp,
                            size: 40,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Location',
                        style: AppTextStyles.inter12w400(color: context.black),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    Get.find<ChatController>().sendContact();
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: context.lightGrey_2),
                        child: const Center(
                          child: Icon(
                            Icons.contact_phone_sharp,
                            size: 35,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Contacts',
                        style: AppTextStyles.inter12w400(color: context.black),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.find<ChatController>().sendDocument();
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: context.lightGrey_2),
                        child: Center(
                          child: Icon(
                            Icons.edit_document,
                            size: 40,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Document',
                        style: AppTextStyles.inter12w400(color: context.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
