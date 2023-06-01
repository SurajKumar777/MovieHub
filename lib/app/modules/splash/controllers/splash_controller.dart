import 'package:get/get.dart';
import 'package:moviehub/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(Routes.LOGIN);
      },
    );
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
}
