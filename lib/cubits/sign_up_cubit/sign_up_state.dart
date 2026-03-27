part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class StateSuccess extends SignUpState {
  final UserEntity userEntity;

  StateSuccess({required this.userEntity});
}
final class StateFailure extends SignUpState {
final String message;

  StateFailure({required this.message});
}
final class StateLoading extends SignUpState {}



