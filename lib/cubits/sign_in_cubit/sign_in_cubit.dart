import 'package:bloc/bloc.dart';
import 'package:ecommercefrutes/features/auth/domain/entities/user_entity.dart';
import 'package:ecommercefrutes/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  Future<void>signInWitnEmailAndPassword(String email, String password)async{
    emit(StateSignInLoading());
    final result=await authRepo.SignInwithEmailAndPassword(email, password);
    result.fold( 
       (failure)=>emit(StateSignInFailure(message: failure.message)),
     (userEntity)=>emit(StateSignSuccess(userEntity: userEntity)),
    
    );
  }
  Future<void>signInWithGoogle()async{
    emit(StateSignInLoading());
    final result=await authRepo.signInwithGoogle();
    result.fold(  (failure)=>emit(StateSignInFailure(message: failure.message)),
     (userEntity)=>emit(StateSignSuccess(userEntity: userEntity)),);
  }
   Future<void>signInWithFaceBook()async{
    emit(StateSignInLoading());
    final result=await authRepo.signInwithFaceBook();
    result.fold(  (failure)=>emit(StateSignInFailure(message: failure.message)),
     (userEntity)=>emit(StateSignSuccess(userEntity: userEntity)),);
  }
}
