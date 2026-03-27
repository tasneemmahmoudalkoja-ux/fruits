import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onTap, });
 final bool isChecked;
final Function()onTap;
  @override
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Size.width/12,
        height: Size.width/12,
        decoration: BoxDecoration(
          color: isChecked?AppColors.PrimaryColor:Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: Size.width/250,color:isChecked? Colors.transparent: Colors.grey)
        ),
        child: Icon(Icons.check,color: Colors.white,),
      ),
    );
  }
}