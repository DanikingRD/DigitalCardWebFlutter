import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';

class FirebaseAuthService {
  final FirebaseAuth _instance = FirebaseAuth.instance;

  Future<void> sendResetPasswordLink({
    required String email,
    Function(String? message)? onError,
    Function()? onSuccess,
  }) async {
    try {
      await _instance.sendPasswordResetEmail(email: email);
      if (onSuccess != null) {
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      if (onError != null) {
        onError(e.message);
      }
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
    Function(String? message)? onError,
    Function(UserCredential)? onSuccess,
  }) async {
    try {
      final UserCredential result = await _instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (onSuccess != null) {
        onSuccess(result);
      }
    } on FirebaseAuthException catch (e) {
      if (onError != null) onError(e.message);
    }
  }

  Future<void> logOut({
    required VoidCallback? onSuccess,
    required Function(String? message)? onError,
  }) async {
    try {
      await _instance.signOut();
      if (onSuccess != null) {
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      if (onError != null) {
        onError(e.message);
      }
    }
  }
}
