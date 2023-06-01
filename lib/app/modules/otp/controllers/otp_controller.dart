import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/app_pages.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  final FirebaseAuth auth = FirebaseAuth.instance;
  var verifyId;
  var pin = ''.obs;
  var loading = false.obs;
  @override
  void onInit() {
    verifyId = Get.arguments['id'];
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
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: pin.value);
      await auth.signInWithCredential(credential);
      log(credential.toString());
      loading.value = false;
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      loading.value = false;
    }
  }
}
