import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/exercises_model.dart';

class ExercisesController extends GetxController {
  var exercises = <ExercisesModel>[].obs;
  var isLoading = false.obs;

  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com/exercises';
  static const String _nameSearchUrl = 'https://exercisedb.p.rapidapi.com/exercises/name/';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';

  @override
  void onInit() {
    super.onInit();
    fetchExercises();
  }

  // Generalized method to fetch exercises with optional query for search
  void fetchExercises({String? query, int offset = 0, int limit = 10}) async {
    try {
      isLoading(true);
      final url = query != null && query.isNotEmpty
          ? Uri.parse("$_nameSearchUrl$query?offset=$offset&limit=$limit")
          : Uri.parse("$_baseUrl?limit=$limit&offset=$offset");

      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        exercises.value = jsonResponse.map((data) => ExercisesModel.fromJson(data)).toList();
        print(response.body);
      } else {
        Get.snackbar('Error', 'Failed to load exercises');
      }
    } catch (e) {
      print("Error fetching exercises: $e");
    } finally {
      isLoading(false);
    }
  }

  // Methods to access exercise details based on index
  String? nameDetail(int index) => exercises[index].name?.capitalizeFirst;
  String? targetMuscle(int index) => exercises[index].target?.capitalizeFirst;
  String? equipment(int index) => exercises[index].equipment?.capitalizeFirst;
  String? imageExercise(int index) => exercises[index].gifUrl;
  List<String> secondaryMuscles(int index) => exercises[index].secondaryMuscles ?? ['No secondary muscles listed'];
  List<String> instructionExercise(int index) => exercises[index].instructions ?? ['No instructions available'];
}
