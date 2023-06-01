import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviehub/app/routes/app_pages.dart';
import 'package:moviehub/app/widgets/CustomButton.dart';
import 'package:moviehub/app/widgets/CustomInput.dart';
import 'package:moviehub/app/widgets/custom_text.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.loading.value == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Sending OTP..."),
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator()
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kToolbarHeight,
                  ),
                  CustomText(
                    text: "Login",
                    bold: true,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(text: "Enter your phone number to login."),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomInput(
                    prifixIcon: const Icon(Icons.phone),
                    hintText: "Phone Number",
                    controller: controller.phone,
                    isNum: true,
                    validation: (val) {},
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () => controller.onSubmitHandler(context),
                      child: CustomButton(
                        text: "Submit",
                        width: Get.width,
                      )),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
    ));
  }
}
