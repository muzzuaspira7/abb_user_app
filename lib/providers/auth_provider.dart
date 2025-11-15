import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firebase_auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();
  User? user;
  bool loading = false;

  AuthProvider() {
    _authService.authStateChanges.listen((user) {
      this.user = user;
      notifyListeners();
    });
  }

  /// Login
  Future<void> login(String email, String password) async {
    loading = true;
    notifyListeners();

    try {
      User? user = await _authService.login(email: email, password: password);

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        throw Exception(
            "Your email is not verified. A verification link has been sent to your inbox.");
      }

      this.user = user;
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  /// Sign Up
  Future<void> signUp(String email, String password, String name) async {
  loading = true;
  notifyListeners();

  try {
    User? user = await _authService.signUp(email: email, password: password);

    if (user != null) {
      // verificatiponm emaill!!!!!!!!!!!!!!!!!!!!!!!!!! S E N T 
      await user.sendEmailVerification();

      // addin to firestore
      await _authService.createUserInFirestore(
        uid: user.uid,
        name: name,
        email: email,
      );

      // verification aut0 deletion
      _authService.scheduleDeleteIfNotVerified(user);

      throw Exception(
        "Account created! Please verify your email before login.",
      );
    }
  } catch (e) {
    rethrow;
  } finally {
    loading = false;
    notifyListeners();
  }
}

  /// Logout
  Future<void> logout() async {
    await _authService.logout();
    user = null;
    notifyListeners();
  }
}
