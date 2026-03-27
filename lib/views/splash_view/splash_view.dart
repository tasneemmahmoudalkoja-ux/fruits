import 'package:ecommercefrutes/core/services/shared_prefrance_repo.dart';
import 'package:ecommercefrutes/views/login_view/login_view.dart';
import 'package:ecommercefrutes/views/on_boarding_view/on_boarding_view.dart';
import 'package:ecommercefrutes/views/splash_view/splash_body_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
 static const routeName='SplashView';
 
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
   excuteNavigation();
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBodyView(),
    );
  }
   void excuteNavigation() {
    Future.delayed(Duration(seconds: 3),(){
     bool isFirstLunch = SharedPrefranceRepo().getFirstLunch();
    if (isFirstLunch) {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    }
    });
  }
}