import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviehub/app/routes/app_pages.dart';
import 'package:moviehub/app/widgets/custom_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: CustomText(
            text: "MoviesHub",
            color: Colors.white,
            size: 20,
            bold: true,
          ),
          actions: [
            IconButton(
              onPressed: null,
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Obx(
          () => controller.loading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid.builder(
                          itemCount: controller.loading.value == true
                              ? 10
                              : controller.movieList['results'].length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => controller.onTap(index),
                              child: Container(
                                color: Colors.grey.shade100,
                                child: Column(
                                  children: [
                                    Image.network(
                                      'https://image.tmdb.org/t/p/original${controller.movieList['results'][index]['backdrop_path']}',
                                    ),
                                    CustomText(
                                      text: controller.movieList['results']
                                          [index]['title'],
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
        ));
  }
}
