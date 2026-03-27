import 'package:ecommercefrutes/views/home_view/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
       child:     CustomHomeAppBar()
        )
      ],
    );
  }
}