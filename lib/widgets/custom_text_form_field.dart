import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hinText, required this.textInputType,  this.icon, this.onSaved, this.controller,  this.obscureText=false});
  final String hinText;
  final TextInputType textInputType;
  final Widget ?icon;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onSaved: onSaved,
      keyboardType: textInputType,
      validator: (value) {
        if(value==null||value.isEmpty){
          return 'هذا الحقل مطلوب';
        }
        return null;

      },
      decoration:InputDecoration(
        suffixIcon: icon,
        hintText:hinText,
        hintStyle: AppTextStyle.bold16.copyWith(color: Color(0xFF949D9D)),
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        border: border(),
        focusedBorder:border(),
        enabledBorder: border(),
        enabled: true,
        
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(width: 2,color: Color(0xFFE6E9E9)),
        
      );
  }
}