import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _instance = FirebaseAuth.instance;

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
}
