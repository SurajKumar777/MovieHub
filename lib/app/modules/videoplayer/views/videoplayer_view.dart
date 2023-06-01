import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/videoplayer_controller.dart';

class VideoplayerView extends GetView<VideoplayerController> {
  const VideoplayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoplayerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideoplayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
