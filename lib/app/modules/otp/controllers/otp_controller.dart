import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
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

  void onSubmitHandler(context) async {
    loading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: pin.value);
      await auth.signInWithCredential(credential);
      log("hii" + credential.toString());
      loading.value = false;
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      loading.value = false;
      if (e.toString().contains("expired")) {
        AnimatedSnackBar.material(
          duration: Duration(microseconds: 50),
          "Your otp expired.",
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else {
        AnimatedSnackBar.material(
          duration: Duration(microseconds: 100),
          "Your otp is invaild.",
          type: AnimatedSnackBarType.error,
        ).show(context);
      }
    }
  }
}
