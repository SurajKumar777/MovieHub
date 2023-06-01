import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviehub/app/routes/app_pages.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

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

  void onSubmitHandler(context) async {
    loading.value = true;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${phone.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        loading.value = false;
        AnimatedSnackBar.material(
          duration: Duration(microseconds: 50),
          "To many attempts try few minutes later.",
          type: AnimatedSnackBarType.error,
        ).show(context);
      },
      codeSent: (String verificationId, int? resendToken) {
        loading.value = false;
        Get.toNamed(Routes.OTP, arguments: {"id": verificationId});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
