import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviehub/app/widgets/CustomButton.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../widgets/custom_text.dart';
import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  MovieDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: CustomText(
            text: "Details Page",
            color: Colors.white,
            size: 20,
            bold: true,
          ),
        ),
        body: Obx(
          () => controller.loading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    YoutubePlayerBuilder(
                      player: YoutubePlayer(
                        controller: controller.controller,
                      ),
                      builder: (context, player) {
                        return Column(
                          children: [
                            // some widgets
                            player,
                            //some other widgets
                          ],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: CustomText(
                        text: controller.movieDetails['original_title'],
                        size: 20,
                        bold: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 5),
                      child: CustomText(
                        text: controller.movieDetails['overview'],
                        size: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          InkWell(child: CustomButton(text: "Watch Trailer")),
                    )
                  ],
                ),
        ));
  }
}
