import 'dart:developer';
import 'package:ecommercefrutes/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future deletUser()async{
    await FirebaseAuth.instance.currentUser!.delete();
  }
  Future<User> createUserwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService with createUserwithEmailAndPassword ${e.toString()} and${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: 'الايميل موجود مسبقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: ' لا يوجد انترنت ');
      } else {
        throw CustomExceptions(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا');
      }
    } catch (e) {
      throw CustomExceptions(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService with createUserwithEmailAndPassword ${e.toString()} and${e.code}',
      );

      if (e.code == 'user-not-found') {
        throw CustomExceptions(message: ' البريد الالكتروني غير صحيح');
      } else if (e.code == 'wrong-password') {
        throw CustomExceptions(message: 'كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomExceptions(message: ' لا يوجد انترنت ');
      } else {
        throw CustomExceptions(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا');
      }
    } catch (e) {
      throw CustomExceptions(message: 'لقد حدث خطا ما الرجاء المحاولة لاحقا');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      serverClientId:
          "453872297129-it3do288tnlkj6oq5sncpu8e62solo1j.apps.googleusercontent.com",
    );
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
  Future<User> signInWithFacebook() async {
  
    // Start Facebook login
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    
      final AccessToken accessToken = loginResult.accessToken!;

      // 📌 استخرج التوكن بالشكل الصحيح
      final String tokenString = accessToken.tokenString;

      // Create credential for Firebase
      final OAuthCredential facebookCredential =
          FacebookAuthProvider.credential(tokenString);

      // Sign in to Firebase
      return (await FirebaseAuth.instance.signInWithCredential(facebookCredential)).user!;
   
  }
}
