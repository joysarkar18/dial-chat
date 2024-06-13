import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dial_chat/app/utils/color_util.dart';

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({Key? key}) : super(key: key);

  @override
  _MessageInputBarState createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  double _containerHeight = 50.0; // Initial height
  final double _maxContainerHeight = 150.0; // Maximum height to limit expansion
  bool _isFocused = false;
  bool _showOptions = false; // State variable to toggle options

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _controller.dispose();
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
      text: _controller.text,
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
                                      right: 8.0, left: 10.0),
                                  child: TextField(
                                    focusNode: _focusNode,
                                    controller: _controller,
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
                                      Image.asset(
                                        'assets/svg/happy.png',
                                        height: 20,
                                        width: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Image.asset(
                                          'assets/svg/gallery.png',
                                          height: 20,
                                          width: 20,
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
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        color: context.sendBackground, shape: BoxShape.circle),
                    child: Icon(
                      _isFocused ? Icons.send : Icons.mic,
                      color: Colors.white70,
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
            height: 300,
            color: context.white,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                IconButton(
                  onPressed: () {},
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
                            color: Colors.black,
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
                  onPressed: () {},
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
                            Icons.camera_enhance,
                            size: 40,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Camera',
                        style: AppTextStyles.inter12w400(color: context.black),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
                  onPressed: () {},
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
                            Icons.contact_phone_sharp,
                            size: 40,
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
                  onPressed: () {},
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
                IconButton(
                  onPressed: () {},
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
                            Icons.poll,
                            size: 40,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Poll',
                        style: AppTextStyles.inter12w400(color: context.black),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
                            Icons.currency_rupee,
                            size: 40,
                          ),
                        ),
                      ),
                      2.kheightBox,
                      Text(
                        'Payment',
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
