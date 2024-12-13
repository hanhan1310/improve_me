import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController {
  User? get currentUser => FirebaseAuth.instance.currentUser;

  /// sign up
  Future<void> createUserByEmailAndPassword({required String email, required String password}) async {
    bool result = false;
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await saveUserToPreferences(credential.user);
      result = true;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


  /// Sign in
  Future<bool> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await saveUserToPreferences(credential.user);
      print("Sign in successful");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> saveUserToPreferences(User? user) async {
    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', user.uid);
      await prefs.setString('email', user.email ?? "");
      print("User saved to SharedPreferences: UID=${user.uid}");
    }
  }


  /// Sign out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();

    // Xóa thông tin từ SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
    await prefs.remove('email');
    print("User signed out and data removed from SharedPreferences.");
  }

  /// Check login status
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');
    final email = prefs.getString('email');

    if (uid != null && email != null) {
      print("User logged in: UID=$uid, Email=$email");
      return true;
    } else {
      print("No user logged in.");
      return false;
    }
  }

}