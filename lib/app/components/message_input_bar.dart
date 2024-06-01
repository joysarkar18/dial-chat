import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class MessageInputBar extends StatefulWidget {
  const MessageInputBar({super.key});

  @override
  _MessageInputBarState createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  double _containerHeight = 50.0; // Initial height
  final double _maxContainerHeight = 150.0; // Maximum height to limit expansion
  bool _isFocused = false;
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

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: MediaQuery.of(context).size.width,
        height: _containerHeight + 40,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              5.kwidthBox,
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1),
                ),
                child: const Icon(
                  Icons.add,
                  size: 20,
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
                              width: 240.kw,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 10.0),
                                child: TextField(
                                  focusNode: _focusNode,
                                  controller: _controller,
                                  maxLines: null,
                                  onChanged: (text) => _updateContainerHeight(),
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
                                      padding: const EdgeInsets.only(left: 8.0),
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
                child: Icon(_isFocused ? Icons.send : Icons.mic),
              ),
              10.kwidthBox,
            ],
          ),
        ),
      ),
    );
  }
}
