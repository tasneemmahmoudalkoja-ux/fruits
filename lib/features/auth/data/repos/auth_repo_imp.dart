import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommercefrutes/core/errors/exceptions.dart';
import 'package:ecommercefrutes/core/errors/failure_error.dart';
import 'package:ecommercefrutes/core/services/firestore_service.dart';
import 'package:ecommercefrutes/core/utiles/constants.dart';
import 'package:ecommercefrutes/features/auth/data/models/user_model.dart';
import 'package:ecommercefrutes/features/auth/domain/entities/user_entity.dart';
import 'package:ecommercefrutes/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommercefrutes/core/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImp({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });
  @override
  Future<Either<FailureError, UserEntity>> SignInwithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      var userentity = await getUserData(userId: user.uid);
      return right(userentity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      log('Exception is createUserWithEmailAndPassword ${e.toString()}');

      return left(
        ServerFailure(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا'),
      );
    }
  }

  @override
  Future<Either<FailureError, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserwithEmailAndPassword(
        email: email,
        password: password,
      );
      var userentity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userentity);
      return right(userentity);
    } on CustomExceptions catch (e) {
      if (user != null) {
        await firebaseAuthService.deletUser();
      }
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      log('Exception is createUserWithEmailAndPassword ${e.toString()}');
      if (user != null) {
        await firebaseAuthService.deletUser();
      }
      return left(
        ServerFailure(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا'),
      );
    }
  }

  @override
  Future<Either<FailureError, UserEntity>> signInwithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userentity=UserModel.fromFireBaseUser(user);
      bool isUserExsist = await dataBaseService.checkIfDataExists(
        collectionName: addUserDataCollection,
        documentId: user.uid,
      );
      if (isUserExsist) {
        await getUserData(userId: user.uid);
      } else {
      await addUserData(user: userentity);

      }
      return right(userentity);
    } catch (e) {
      log('Exception is createUserWithEmailAndPassword ${e.toString()}');

      return left(
        ServerFailure(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا'),
      );
    }
  }

  @override
  Future<Either<FailureError, UserEntity>> signInwithFaceBook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFireBaseUser(user));
    } catch (e) {
      log('Exception is createUserWithEmailAndPassword ${e.toString()}');

      return left(
        ServerFailure(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    try {
      await dataBaseService.addData(
        collictionName: addUserDataCollection,
        data: user.toMap(),
        docId: user.uId,
      );
    } catch (e) {}
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var user = await dataBaseService.getData(
      collictionName: addUserDataCollection,
      userId: userId,
    );
    return UserModel.fromjson(user);
  }
}
