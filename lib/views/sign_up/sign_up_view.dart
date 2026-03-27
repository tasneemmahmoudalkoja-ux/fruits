import 'package:ecommercefrutes/core/helper_functions/buils_error_bar.dart';
import 'package:ecommercefrutes/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommercefrutes/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommercefrutes/core/services/get_it_service.dart';
import 'package:ecommercefrutes/generated/intl/messages_ar.dart';
import 'package:ecommercefrutes/views/home_view/home_view.dart';
import 'package:ecommercefrutes/views/login_view/login_view.dart';
import 'package:ecommercefrutes/views/sign_up/sign_up_body.dart';
import 'package:ecommercefrutes/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends StatelessWidget {
   SignUpView({super.key});
  static const routName = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(title: 'انشاء حساب'),
        body: SafeArea(
          child: Builder(
            builder: (context) {
              return BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                if(state is StateSuccess){
                   Navigator.pop(context);                 }
                if(state is StateFailure){
                     BuildErrorBar(context, state.message);
                }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall:  state is StateLoading?true:false,
                  child: SignUpBody());
                },
              );
            }
          ),
        ),
      ),
    );
  }

 
}
