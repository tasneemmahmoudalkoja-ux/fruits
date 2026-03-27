import 'package:ecommercefrutes/core/utiles/app_colors.dart';
import 'package:ecommercefrutes/core/utiles/app_images.dart';
import 'package:ecommercefrutes/core/utiles/app_text_style.dart';
import 'package:ecommercefrutes/core/utiles/constants.dart';
import 'package:ecommercefrutes/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:ecommercefrutes/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommercefrutes/views/sign_up/sign_up_view.dart';
import 'package:ecommercefrutes/widgets/custom_botton.dart';
import 'package:ecommercefrutes/widgets/custom_or_divider.dart';
import 'package:ecommercefrutes/widgets/custom_password_field.dart';
import 'package:ecommercefrutes/widgets/custom_social_botton.dart';
import 'package:ecommercefrutes/widgets/custom_text_form_field.dart';
import 'package:ecommercefrutes/widgets/custom_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBodyView extends StatefulWidget {
  const LoginBodyView({super.key});

  @override
  State<LoginBodyView> createState() => _LoginBodyViewState();
}

class _LoginBodyViewState extends State<LoginBodyView> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  GlobalKey<FormState>formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHorizantalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                controller: emailController,
                hinText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
          
            passwordField( controller:  passwordController,),
          
              SizedBox(height: 16),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور ؟',
                    style: AppTextStyle.semiBold16.copyWith(
                      color: AppColors.LightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              CustomBotton(onPressed: () {
                if(formKey.currentState!.validate()){
                    context.read<SignInCubit>().signInWitnEmailAndPassword(emailController.text, passwordController.text, );

                }else{
                  autovalidateMode=AutovalidateMode.always;
                }
              }
              , text: 'تسجيل الدخول'),
              SizedBox(height: 30),
          
              CustomTextSpan(text1: 'لاتمتلك حساب ؟', text2: 'قم بانشاء حساب', onTap:  () {
                  print("clicked"); // للتأكد
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignUpView();
                  }));
                },),
              SizedBox(height: 30),
          
              CustomOrDivider(),
                          SizedBox(height: 30),
          
              CustomSocialBotton(
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل بواسطة غوغل',
                onPressed: () {
                                      context.read<SignInCubit>().signInWithGoogle();

                },
              ),
              SizedBox(height: 16),
          
              CustomSocialBotton(
                image: Assets.assetsImagesApplIcon,
                title: 'تسجيل بواسطة ابل',
                onPressed: () {},
              ),
              SizedBox(height: 16),
          
              CustomSocialBotton(
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
                onPressed: () {
                       context.read<SignInCubit>().signInWithFaceBook();

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
