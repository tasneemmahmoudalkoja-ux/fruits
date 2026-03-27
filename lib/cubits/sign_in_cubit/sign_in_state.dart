part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class StateSignInLoading extends SignInState {}
final class StateSignSuccess extends SignInState {
  final UserEntity userEntity;

  StateSignSuccess({required this.userEntity});
  
}
final class StateSignInFailure extends SignInState {
  final  String message;

  StateSignInFailure({required this.message});
}


