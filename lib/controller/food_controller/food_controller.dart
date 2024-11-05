import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improve_me/model/food_model.dart';

class FoodController extends GetxController {
  var foodList = <FoodModel>[].obs;
  var isLoading = true.obs;

  static const String _baseUrl = 'https://the-vegan-recipes-db.p.rapidapi.com/';
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
          'X-RapidAPI-Host': 'the-vegan-recipes-db.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Check if jsonResponse is a list of food items
        if (jsonResponse is List) {
          // Map each JSON item to a FoodModel instance
          foodList.value = jsonResponse
              .map((item) => FoodModel.fromJson(item as Map<String, dynamic>))
              .toList();
        } else {
          print("Unexpected response format: $jsonResponse");
        }
      } else {
        print("API error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error fetching food data: $e");
    } finally {
      isLoading(false);
    }
  }

  // Extracts image URLs from the food list
  List<String?> getImage() {
    return foodList.map((foodItem) => foodItem.image).toList();
  }

  // Extracts titles from the food list
  List<String?> getName() {
    return foodList.map((foodItem) => foodItem.title).toList();
  }
}
