import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:improve_me/model/firebase_storage_model.dart';

class FirestoreService {
  final CollectionReference idExercise =
      FirebaseFirestore.instance.collection("exercises");

  Future<void> addExercises(
      {required String id,
      required String name,
      required String bodyPart,
      required String idUser}) {
    return idExercise.add({
      "id": id,
      "name exercise": name,
      "bodyPart": bodyPart,
      "id user": idUser,
    });
  }

  Stream<List<FirebaseStorageModel>> getExercises(String userId) {
    return idExercise
        .where('id user', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      final exercises = snapshot.docs.map((doc) {
        return FirebaseStorageModel.fromDocument(doc);
      }).toList();
      return exercises;
    });
  }

}