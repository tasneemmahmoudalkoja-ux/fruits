import 'dart:ffi';

import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSocialBotton extends StatelessWidget {
  const CustomSocialBotton({super.key, required this.image, required this.title, required this.onPressed});
  final String image;
  final String title;
  final Function ()onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton.icon(
        
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1),
            borderRadius: BorderRadiusGeometry.circular(16)
          )
        ),
        onPressed: onPressed, label: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: Text(title,style: AppTextStyle.semiBold16,textAlign: TextAlign.center,)),icon:SvgPicture.asset(image) ,),
    );
  }
}