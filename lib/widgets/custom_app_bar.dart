import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title:Text(title,textAlign: TextAlign.center,style: AppTextStyle.bold19,) ,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios_new)),
    );
  }
  
  @override
  // TODO: implement preferredSize
Size get preferredSize => const Size.fromHeight(80);}