import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviehub/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  var phone = TextEditingController();
  var loading = false.obs;
  @override
  void onInit() {
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

  void onSubmitHandler() async {
    loading.value = true;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${phone.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        loading.value = false;
        Get.toNamed(Routes.OTP, arguments: {"id": verificationId});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
