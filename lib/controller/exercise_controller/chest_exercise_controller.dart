import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improve_me/model/chest_exercises_model.dart';

class ChestExercisesController extends GetxController {
  var chestExercise = <ChestExercisesModel>[].obs;
  var isLoading = true.obs;

  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com/exercises/name/chest?offset=0&limit=20';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  void fetchRecipes() async {
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
        chestExercise.value = jsonResponse.map((recipe) => ChestExercisesModel.fromJson(recipe)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load recipes');
      }
    } finally {
      isLoading(false);
    }
  }

  List<String?> nameExercises () {
    List<String?> nameExercises = chestExercise?.map((e) => e.name).toList() ?? [];
    return nameExercises;
  }
}
