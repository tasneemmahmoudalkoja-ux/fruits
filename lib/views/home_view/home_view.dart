import 'package:ecommercefrutes/views/home_view/home_body_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
 static const  routName='HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  SafeArea(child: HomeBodyView()));
  }
}