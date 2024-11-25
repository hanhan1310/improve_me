import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
  final CollectionReference usersCollection  = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(String idUser,String userName, String email, String password, String privacyQuestion) {
    return usersCollection.add({
      "id user": idUser,
      "user name": userName,
      "email": email,
      "password": password,
      "privacy question": privacyQuestion,
    });
  }

  Future<Map<String, dynamic>> getUserData(String userId) async {
    final snapshot = await usersCollection.where("id user", isEqualTo: userId).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data() as Map<String, dynamic>;
    }
    throw Exception("User not found");
  }
}