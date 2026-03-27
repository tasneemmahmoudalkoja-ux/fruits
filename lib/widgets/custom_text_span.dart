import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:ecommercefrutes/views/sign_up/sign_up_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({
    super.key,
    required this.text1,
    required this.text2, required this.onTap,
  });

  final String text1;
  final String text2;
  final Function()onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: AppTextStyle.semiBold16.copyWith(
              color: AppColors.PrimaryColor,
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: text2,
            style: AppTextStyle.semiBold16.copyWith(
              color: Colors.grey,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap =onTap,
          ),
        ],
      ),
    );
  }
}