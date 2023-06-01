import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomInput extends StatelessWidget {
  final Icon prifixIcon;
  final String hintText;
  final bool isNum;
  final bool isSecure;
  String? Function(String?)? validation;
  TextEditingController controller;
  CustomInput({
    super.key,
    required this.prifixIcon,
    required this.hintText,
    required this.controller,
    this.isNum = false,
    this.isSecure = false,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isNum ? TextInputType.phone : TextInputType.text,
      obscureText: isSecure,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prifixIcon,
        prefixText: "+91 ",
      ),
      validator: validation,
      maxLength: isNum == true ? 10 : null,
    );
  }
}
