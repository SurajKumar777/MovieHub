import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/CustomButton.dart';
import '../../../widgets/custom_text.dart';
import '../controllers/otp_controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: controller.loading.value == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Redirecting to Home..."),
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
                  CustomText(
                    text: "OTP",
                    bold: true,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(text: "Please enter otp."),
                  const SizedBox(
                    height: 50,
                  ),
                  OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 30,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      controller.pin.value = pin;
                    },
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: controller.onSubmitHandler,
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
    );
  }
}
