import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:ecommercefrutes/core/utiles/constants.dart';
import 'package:ecommercefrutes/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class CustomTermsAndCondition extends StatelessWidget {
  const CustomTermsAndCondition({
    super.key,
   required this.isAccept, required this.onTap,
  });
  
  final bool isAccept;
  final Function ()onTap;
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;

    return Row(
      children: [
      CustomCheckBox(isChecked: isAccept, onTap:onTap),
        SizedBox(width: Size.width / 25),

        SizedBox(
          width: Size.width - KHorizantalPadding - 64,

          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' من خلال إنشاء حساب، فإنك توافق على',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: ' الشروط والأحكام ',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: AppColors.LightPrimaryColor,
                  ),
                ),
                TextSpan(text: ' ', style: AppTextStyle.semiBold13),
                TextSpan(
                  text: ' الخاصة',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: AppColors.LightPrimaryColor,
                  ),
                ),
                TextSpan(text: ' ', style: AppTextStyle.semiBold13),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyle.semiBold13.copyWith(
                    color: AppColors.LightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
