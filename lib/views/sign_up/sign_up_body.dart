import 'dart:ffi';

import 'package:ecommercefrutes/core/helper_functions/buils_error_bar.dart';
import 'package:ecommercefrutes/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommercefrutes/views/login_view/login_view.dart';
import 'package:ecommercefrutes/widgets/custom_botton.dart';
import 'package:ecommercefrutes/widgets/custom_password_field.dart';
import 'package:ecommercefrutes/widgets/custom_terms_and_condition.dart';
import 'package:ecommercefrutes/widgets/custom_text_form_field.dart';
import 'package:ecommercefrutes/widgets/custom_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool isShowEye=false;
  bool isTermsAccepted = false;
 final GlobalKey<FormState>formkey=GlobalKey<FormState>();
 AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
 TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
 TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                controller: nameController,
                hinText: 'الاسم الكامل',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                hinText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
          
              passwordField( controller:  passwordController,),
              SizedBox(height: 16),
              CustomTermsAndCondition(
                isAccept: isTermsAccepted,
                onTap: () {
                  isTermsAccepted = !isTermsAccepted;
                  setState(() {});
                },
              ),
              SizedBox(height: 30),
              CustomBotton(text: 'انشاء حساب', onPressed: () {
                if(formkey.currentState!.validate()){
                  formkey.currentState!.save();
                  if (isTermsAccepted) {
  context.read<SignUpCubit>().createUserEmailAndPassword(emailController.text, passwordController.text, nameController.text);
}else{
  BuildErrorBar(context, 'يجب عليك الموافقة ع الشروط و الاحكام');
}
                }else{
                  setState(() {
                    autovalidateMode=AutovalidateMode.always;
                  });
                }
              }),
                          SizedBox(height: 16),
                          CustomTextSpan(text1: 'تمتلك حساب بالفعل ؟', text2: 'تسجيل الدخول', onTap:  () {
                  print("clicked"); // للتأكد
                  Navigator.pushReplacementNamed(
                    context,
                    LoginView.routeName,
                  );
                },)
          
            ],
          ),
        ),
      ),
    );
  }
}

