import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';

class AuthField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final bool isHidden;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isHidden = false
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const  TextStyle(
          color: AppPallete.textColor
        ),
      ),
      style: const TextStyle(
        color: AppPallete.textColor
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isHidden,
      controller:  controller,
      
    );
  }
}