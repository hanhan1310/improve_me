import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improve_me/model/food_model.dart';

class FoodController extends GetxController {
  var food = <FoodModel>[].obs;
  var isLoading = true.obs;

  static const String _baseUrl = 'https://food-recipes-with-images.p.rapidapi.com/?q=food';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';

  @override
  void onInit() {
    fetchFood();
    super.onInit();
  }

  void fetchFood() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'food-recipes-with-images.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        food.value = jsonResponse.map((context) => FoodModel.fromJson(context)).toList();
      } else {
        print("${response.body} error");
      }
    } catch (e) {
      print("Error fetching food data: $e");
    } finally {
      isLoading(false);
    }
  }

  List<String?> getImage() {
    return food.expand((foodModel) => foodModel.d ?? []).map<String?>((d) => d.image).toList();
  }

  List<String?> getName() {
    return food.expand((foodModel) => foodModel.d ?? []).map<String?>((d) => d.title).toList();
  }
}
