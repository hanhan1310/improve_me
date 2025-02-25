import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:improve_me/model/firebase_storage_model.dart';

class FirestoreService {
  final CollectionReference idExercise =
      FirebaseFirestore.instance.collection("exercises");

  Future<void> addExercises({
    required String id,
    required String name,
    required String bodyPart,
    required String idUser,
  }) async {
    try {
      await idExercise.add({
        "id": id,
        "name exercise": name,
        "bodyPart": bodyPart,
        "id user": idUser,
      });
      print("Exercise added successfully!");
    } catch (e) {
      print("Error adding exercise: $e");
    }
  }

  Stream<List<FirebaseStorageModel>> getExercises(String userId) {
    return idExercise
        .where('id user', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        print("No exercises found for user $userId");
      }
      return snapshot.docs.map((doc) {
        print("Document: ${doc.data()}");
        return FirebaseStorageModel.fromDocument(doc);
      }).toList();
    });
  }
}
