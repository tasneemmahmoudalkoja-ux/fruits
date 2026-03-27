import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:ecommercefrutes/core/services/shared_prefrance_repo.dart';
import 'package:ecommercefrutes/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemOnBoarding extends StatelessWidget {
  const ItemOnBoarding({
    super.key,
    required this.title,
    required this.SubTitle,
    required this.image,
    required this.backgroundImage,
    required this.isVisible,
  });
  final Widget title;
  final String SubTitle;
  final String image, backgroundImage;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 1.1,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image, width: 250),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Visibility(
                  visible: isVisible,
                  child: InkWell(
                    onTap: () {
                      SharedPrefranceRepo().setFirstLunch(false);

                      Navigator.pushReplacementNamed(
                        context,
                        LoginView.routeName,
                      );
                    },
                    child: const Text(
                      'تخط',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            SubTitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.semiBold13.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
