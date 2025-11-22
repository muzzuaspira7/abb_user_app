import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// SIGNUP
  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_getFirebaseError(e));
    }
  }

  /// LOGIN
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return cred.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(_getFirebaseError(e));
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// FIRESTORE USER CREATION
  Future<void> createUserInFirestore({
    required String uid,
    required String name,
    required String email,
  }) async {
    await _firestore.collection("users").doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "totalOrders": 0,
      "lastOrderId": null,
      "phone": null,
      "address": null,
      "pincode": null,
      "savedAddresses": [],
    });
  }

  /// DELETE IF NOT VERIFIED (Auto)
  void scheduleDeleteIfNotVerified(User user) {
    Future.delayed(const Duration(minutes: 3), () async {
      await user.reload();
      User? updatedUser = _auth.currentUser;

      if (updatedUser != null && !updatedUser.emailVerified) {
        await deleteUserCompletely(updatedUser);
      }
    });
  }

  /// Delete From Both AUTH + FIRESTORE | | | | | |
  Future<void> deleteUserCompletely(User user) async {
    try {
      // Delete Firestore Document
      await _firestore.collection("users").doc(user.uid).delete();

      // Delete Auth user
      await user.delete();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }

  /// Error Handler
  String _getFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return "Invalid email.";
      case 'user-disabled':
        return "Account disabled.";
      case 'user-not-found':
        return "User not found.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'email-already-in-use':
        return "Email already in use.";
      case 'weak-password':
        return "Weak password.";
      default:
        return e.message ?? "Auth error.";
    }
  }
}