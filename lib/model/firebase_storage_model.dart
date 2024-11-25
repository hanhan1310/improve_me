import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStorageModel {
  final String? id;
  final String? name;
  final String? bodyPart;
  final String? idUser;

  FirebaseStorageModel({this.id, this.name, this.bodyPart, this.idUser});

  factory FirebaseStorageModel.fromDocument(DocumentSnapshot doc) {
    return FirebaseStorageModel(
      id: doc['id'] as String?,
      name: doc['name exercise'] as String?,
      bodyPart: doc['bodyPart'] as String?,
      idUser: doc['id user'] as String?,
    );
  }
}