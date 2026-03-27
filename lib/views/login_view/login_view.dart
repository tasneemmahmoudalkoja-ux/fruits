import 'package:ecommercefrutes/core/helper_functions/buils_error_bar.dart';
import 'package:ecommercefrutes/core/services/get_it_service.dart';
import 'package:ecommercefrutes/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:ecommercefrutes/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommercefrutes/views/home_view/home_view.dart';
import 'package:ecommercefrutes/views/login_view/login_body_view.dart';
import 'package:ecommercefrutes/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'تسجيل دخول'),
        body: SafeArea(
          child: Builder(
            builder: (context) {
              return BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is StateSignSuccess) {
                    Navigator.pushReplacementNamed(context, HomeView.routName);
                  } else if (state is StateSignInFailure) {
                    BuildErrorBar(context, state.message);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is StateSignInLoading ? true : false,
                    child: LoginBodyView(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
