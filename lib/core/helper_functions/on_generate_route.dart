import 'package:ecommercefrutes/views/home_view/home_view.dart';
import 'package:ecommercefrutes/views/login_view/login_view.dart';
import 'package:ecommercefrutes/views/on_boarding_view/on_boarding_view.dart';
import 'package:ecommercefrutes/views/sign_up/sign_up_view.dart';
import 'package:ecommercefrutes/views/splash_view/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings)
{
  switch (settings.name)
  {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
     case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
       case SignUpView.routName:
      return MaterialPageRoute(builder: (context) =>  SignUpView());
       case HomeView.routName:
      return MaterialPageRoute(builder: (context) =>  HomeView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
