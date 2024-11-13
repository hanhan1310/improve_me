import 'package:firebase_auth/firebase_auth.dart';

class SignUpController {
  /// sign up
  Future<void> createUserByEmailAndPassword({required String email, required String password}) async {
    bool result = false;
    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("login oke");
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
}