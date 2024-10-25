import 'package:get/get.dart';
import '../../service/api_service/api_service.dart';

class ExerciseController extends GetxController {
  var exercises = <dynamic>[].obs;
  var isLoading = false.obs;

  final ApiService apiService;

  ExerciseController({required this.apiService});

  @override
  void onInit() {
    super.onInit();
    fetchExercises();
  }

  void fetchExercises() async {
    isLoading(true);
    try {
      var data = await apiService.fetchExercises();
      exercises.value = data;
      print(data);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
