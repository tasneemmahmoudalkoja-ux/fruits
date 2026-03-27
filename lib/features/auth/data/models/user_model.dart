import 'package:ecommercefrutes/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
  });
  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.displayName ?? '',
      uId: user.displayName ?? '',
    );
  }
   factory UserModel.fromjson(Map<String,dynamic> json) {
    return UserModel(
      name: json['name'],
      email:json['email'],
      uId: json['uId'],
    );
  }
}
