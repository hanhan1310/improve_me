import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:improve_me/model/authentication_model.dart';

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

  Stream<List<AuthenticationModel>> getUserIdData(String userId) {
    return usersCollection
        .where('id user', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        print("No exercises found for user $userId");
      }
      return snapshot.docs.map((doc) {
        print("Document: ${doc.data()}");
        return AuthenticationModel.fromDocument(doc);
      }).toList();
    });
  }


}