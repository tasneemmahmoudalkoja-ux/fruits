import 'package:dartz/dartz.dart';
import 'package:ecommercefrutes/core/errors/failure_error.dart';
import 'package:ecommercefrutes/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<FailureError, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<FailureError, UserEntity>> SignInwithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<FailureError, UserEntity>> signInwithGoogle();
    Future<Either<FailureError, UserEntity>> signInwithFaceBook();
    Future addUserData({required UserEntity user});
    Future<UserEntity> getUserData({required String userId});


}
