import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationModel {
  final String? idUser;
  final String? userName;
  final String? password;
  final String? email;
  final String? privacyQuestion;

  AuthenticationModel(
      {this.idUser,
      this.userName,
      this.password,
      this.email,
      this.privacyQuestion});

  factory AuthenticationModel.fromDocument(DocumentSnapshot doc) {
    return AuthenticationModel(
      idUser: doc['id user'] as String?,
      userName: doc['user name'] as String?,
      email: doc['email'] as String?,
      password: doc['password'] as String?,
      privacyQuestion: doc['privacy question'] as String?,
    );
  }
}