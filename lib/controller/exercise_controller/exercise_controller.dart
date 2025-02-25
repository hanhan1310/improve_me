import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improve_me/controller/sign_up_controller/sign_up_controller.dart';
import 'package:improve_me/utils/firebase_storage.dart';
import 'dart:convert';
import '../../model/exercises_model.dart';

class ExercisesController extends GetxController {
  var exercises = <ExercisesModel>[].obs;
  var isLoading = false.obs;
  final FirestoreService firestoreService = FirestoreService();
  final SignUpController signUpController = SignUpController();
  var isFetchingMore = false.obs;
  var hasMore = true.obs;
  int offset = 0;
  final int limit = 6; // Lấy 6 bài tập mỗi lần

  var exerciseCounts = {
    "pectorals": 0,
    "leg": 0,
    "arm": 0,
    "abs": 0,
    "back": 0,
    "shoulder": 0,
  }.obs;


  String mapBodyPart(String bodyPart) {
    switch (bodyPart.toLowerCase()) {
      case "delts":
        return 'shoulder';
      case 'biceps':
      case 'triceps':
        return 'arm';
      case 'traps':
      case 'lats':
        return 'back';
      case 'calves':
      case 'quads':
      case 'glutes':
        return 'leg';
      default:
        return bodyPart; // Giữ nguyên nếu không cần gộp
    }
  }

  List<String> get bodyParts => exerciseCounts.keys.toList();

  int getCount(String bodyPart) => exerciseCounts[bodyPart] ?? 0;

  List<Map<String, dynamic>> get pieChartData {
    return exerciseCounts.entries
        .map((entry) => {
      'bodyPart': entry.key,
      'count': entry.value,
    })
        .toList();
  }

  static const String _baseUrl = 'https://exercisedb.p.rapidapi.com/exercises';
  static const String _nameSearchUrl = 'https://exercisedb.p.rapidapi.com/exercises/name/';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';


  /// lấy data từ firebase storage và đếm
  void fetchFirestoreExercises({String? userId}) {
    if (userId == null || userId.isEmpty) return;

    firestoreService.getExercises(userId).listen((exercisesList) {
      exerciseCounts.updateAll((key, value) => 0);

      for (var exercise in exercisesList) {
        final bodyPart = mapBodyPart(exercise.bodyPart?.toLowerCase() ?? 'unknown');
        if (exerciseCounts.containsKey(bodyPart)) {
          exerciseCounts[bodyPart] = exerciseCounts[bodyPart]! + 1;
        } else {
          exerciseCounts[bodyPart] = 1;
        }
      }
      exerciseCounts.refresh();
    });
  }

  /// lấy data từ api
  Future<void> fetchExercises({String? query, int offset = 0, int limit = 30}) async {
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
      } else {
        print("Failed to fetch exercises. Status code: ${response.statusCode}");
        print("Response Body: ${response.body}");
        Get.snackbar('Error', 'Failed to load exercises');
      }
    } catch (e) {
      print("Error fetching exercises: $e");
    } finally {
      isLoading(false);
    }
  }


  String? nameDetail(int index) => exercises[index].name?.capitalizeFirst;
  String? targetMuscle(int index) => exercises[index].target?.capitalizeFirst;
  String? equipment(int index) => exercises[index].equipment?.capitalizeFirst;
  String? imageExercise(int index) => exercises[index].gifUrl.toString().trim();
  List<String> secondaryMuscles(int index) => exercises[index].secondaryMuscles ?? ['No secondary muscles listed'];
  List<String> instructionExercise(int index) => exercises[index].instructions ?? ['No instructions available'];


  @override
  void onInit() {
    super.onInit();
    fetchExercises();
    fetchFirestoreExercises(userId: signUpController.currentUser?.uid);
  }
}
