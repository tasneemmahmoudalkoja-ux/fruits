import 'package:bloc/bloc.dart';
import 'package:ecommercefrutes/features/auth/domain/entities/user_entity.dart';
import 'package:ecommercefrutes/features/auth/domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void>createUserEmailAndPassword(String email,String password,String name)async{
    emit(StateLoading());
    final result=await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure)=>emit(StateFailure(message: failure.message)),
     (userEntity)=>emit(StateSuccess(userEntity: userEntity)),

    );
  }
}
