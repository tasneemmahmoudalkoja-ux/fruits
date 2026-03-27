import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        SizedBox(width: 10),
        Text('او', style: AppTextStyle.semiBold16, textAlign: TextAlign.center),
        SizedBox(width: 10),

        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
