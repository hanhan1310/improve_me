import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improve_me/model/exercises_model.dart';

class ChestExercisesController extends GetxController {
  var exercise = <ExercisesModel>[].obs;
  var isLoading = true.obs;

  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com/exercises/name/chest?offset=0&limit=20';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';

  @override
  void onInit() {
    fetchExercise();
    super.onInit();
  }

  void fetchExercise() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        exercise.value = jsonResponse.map((context) => ExercisesModel.fromJson(context)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load recipes');
      }
    } finally {
      isLoading(false);
    }
  }

  List<String?> nameExercises () {
    List<String?> nameExercises = exercise.map((e) => e.name!.capitalizeFirst).toList();
    return nameExercises;
  }



  String? nameDetail (int index) {
    String? name;
    List<String?> nameDetail = exercise.map((e) => e.name).toList();

    for(int i = 0; i < nameDetail.length; i++){
      if(i == index) {
        name = nameDetail[i];
      }
    }
    return name!.capitalizeFirst;
  }

  String? targetMuscle (int index) {
    String? target;
    List<String?> targetMuscles = exercise.map((e) => e.target).toList();

    for(int i = 0; i < targetMuscles.length; i++){
      if(i == index) {
        target = targetMuscles[i];
      }
    }
    return target!.capitalizeFirst;
  }
  String? secondaryMuscles (int index) {
    String? indexId;
    List<String?> idExercises = exercise.map((e) => e.id).toList();

    for(int i = 0; i < idExercises.length; i++){
      if(i == index) {
        indexId = idExercises[i];
      }
    }
    return indexId;
  }
  String? imageExercise (int index) {
    String? image;
    List<String?> iamgeExercises = exercise.map((e) => e.gifUrl).toList();

    for(int i = 0; i < iamgeExercises.length; i++){
      if(i == index) {
        image = iamgeExercises[i];
      }
    }
    return image;
  }
  String? instructionExercise (int index) {
    String? indexId;
    List<String?> idExercises = exercise.map((e) => e.id).toList();

    for(int i = 0; i < idExercises.length; i++){
      if(i == index) {
        indexId = idExercises[i];
      }
    }
    return indexId;
  }
}
