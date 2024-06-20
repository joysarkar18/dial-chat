import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voice_calling_controller.dart';

class VoiceCallingView extends GetView<VoiceCallingController> {
  const VoiceCallingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VoiceCallingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VoiceCallingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
