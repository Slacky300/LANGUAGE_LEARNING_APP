import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final void Function() someFn;
  
  const AuthGradientButton({super.key, required this.buttonText, required this.someFn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppPallete.primaryColor, AppPallete.gradient4],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
        ),
        borderRadius: BorderRadius.circular(7)
      ),
      child: ElevatedButton(
        onPressed:  someFn,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          fixedSize: const Size(395, 55),
          shadowColor: AppPallete.transparentColor
        ),
        child:  Text(
           buttonText,
           style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppPallete.whiteColor
           ),
        ),
      ),
    );
  }
}