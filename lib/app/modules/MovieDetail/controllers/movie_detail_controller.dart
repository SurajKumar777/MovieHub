import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:moviehub/app/constants/api_key.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailController extends GetxController {
  //TODO: Implement MovieDetailController

  final count = 0.obs;
  var id;
  var loading = false.obs;
  var movieDetails = {}.obs;
  var videoRes;
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'AB9yQClEJfY',
    flags: YoutubePlayerFlags(
      mute: true,
    ),
  );

  @override
  void onInit() {
    id = Get.arguments['id'];
    init();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() async {
    loading.value = true;
    try {
      var res = await dio.Dio()
          .get('https://api.themoviedb.org/3/movie/$id?api_key=$apiKey');
      if (res.data['title'] != null) {
        videoRes = await dio.Dio().get(
            'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey');
      }

      movieDetails.value = res.data;

      loading.value = false;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
  }
}
