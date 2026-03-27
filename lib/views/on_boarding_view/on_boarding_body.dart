import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:ecommercefrutes/core/utiles/app_images.dart';
import 'package:ecommercefrutes/core/utiles/app_text.dart';
import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:ecommercefrutes/widgets/item_on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.pageController, required this.isVisible});
 final PageController pageController;
 final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
              children: [
                ItemOnBoarding(
                  isVisible: isVisible,
                  SubTitle: AppText.subTitle1,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text(AppText.title1,style: AppTextStyle.bold23,),
                     
                      Text(AppText.title112,style: AppTextStyle.bold23.copyWith(color:AppColors. SecondaryColor),),
                       Text(AppText.title11,style:AppTextStyle.bold23.copyWith(color:AppColors. PrimaryColor),),
                    ],
                  ),
                  image: Assets.assetsImagesPageViewItem1Image,
                  backgroundImage: Assets.assetsImagesPageViewItem1BackgroundImage,
                ),
                    ItemOnBoarding(
                      isVisible: isVisible,
                  SubTitle: AppText.subTitle1,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppText.title2,style: AppTextStyle.bold23,),
                    ],
                  ),
                  image: Assets.assetsImagesPageViewItem2Image,
                  backgroundImage: Assets.assetsImagesPageViewItem2BackgroundImage,
                ),
               
              ],
            );
  }
}