import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviehub/app/constants/api_key.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  var movieList = {}.obs;
  var loading = false.obs;
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
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
      var res = await Dio()
          .post('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey');
      movieList.value = res.data;
      log(movieList['results'][0]['backdrop_path'].toString());
      loading.value = false;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
  }

  void onTap(index) {
    Get.toNamed(Routes.MOVIE_DETAIL,
        arguments: {'id': movieList['results'][index]['id']});
  }
}
