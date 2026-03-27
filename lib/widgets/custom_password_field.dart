import 'package:ecommercefrutes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class passwordField extends StatefulWidget {
  const passwordField({
    super.key,
    required this.controller,
  });

  final TextEditingController? controller;

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {
   bool obscureText =true;



  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      controller: widget.controller,
      icon: IconButton(
        onPressed: ()
        {
         obscureText=!obscureText;

         setState(() {
           
         });
        },
        icon:obscureText?Icon(Icons.remove_red_eye, color: Colors.grey): Icon(Icons.visibility_off_rounded, color: Colors.grey),
      ),
      hinText: 'كلمة المرور ',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
