 import 'package:ecommercefrutes/core/utiles/app_images.dart';
import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.assetsImagesProfileImage),
title: Text('صباح الخير !..',textAlign: TextAlign.right,style: AppTextStyle.regular16.copyWith(
  color: Color(0xFF949D9E)
),),
subtitle: Text('تسنيم القجة',textAlign: TextAlign.right,style: AppTextStyle.bold16),
   
   trailing: Padding(
     padding: const EdgeInsets.all(6),
     child: Container(
      width: 50,
      height: 50,
      decoration: ShapeDecoration(shape: OvalBorder(),color: Color(0xFF949D9E)),
      child: SvgPicture.asset(Assets.assetsImagesNotification),),
   ),
    );

  }
}