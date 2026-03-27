import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return 
       SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
            backgroundColor: AppColors.PrimaryColor,
          ),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      );
    
  }
}
