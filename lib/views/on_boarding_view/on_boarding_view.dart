import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:ecommercefrutes/core/utiles/constants.dart';
import 'package:ecommercefrutes/core/services/shared_prefrance_repo.dart';
import 'package:ecommercefrutes/views/login_view/login_view.dart';
import 'package:ecommercefrutes/views/on_boarding_view/on_boarding_body.dart';
import 'package:ecommercefrutes/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const routeName = 'OnBoardingView';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    //كل مرة بصير تغيير بالباجفيو جبلي الابيج الحالية
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: OnBoardingBody(
                pageController: pageController,
                isVisible:
                    (pageController.hasClients
                        ? pageController.page!.round()
                        : 0) !=
                    1,
              ),
            ),
            Visibility(
              visible: currentPage == 1 ? true : false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: KHorizantalPadding,
                ),

                child: CustomBotton(
                  text: 'ابدا الان',
                  onPressed: () {
                    SharedPrefranceRepo().setFirstLunch(false);
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 43),
            DotsIndicator(
              dotsCount: 2,
              decorator: DotsDecorator(
                activeColor: AppColors.PrimaryColor,
                color: currentPage == 1
                    ? AppColors.PrimaryColor
                    : AppColors.PrimaryColor.withOpacity(.5),
                activeSize: Size(12, 12),
                size: currentPage == 1 ? Size(12, 12) : Size(10, 10),
              ),
            ),
            SizedBox(height: 43),
          ],
        ),
      ),
    );
  }
}
