import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:improve_me/model/food_model.dart';

import '../../model/detail_food_model.dart';

class DetailFoodController extends GetxController {
  var foodDetail = DetailFoodModel().obs; // Holds the detailed food data
  var isLoading = true.obs;

  static const String _baseUrl = 'https://the-vegan-recipes-db.p.rapidapi.com/';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';

  // Method to fetch food details by ID
  void fetchFoodDetail(String id) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse("$_baseUrl$id"),
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'the-vegan-recipes-db.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        // Parse response and update the foodDetail object
        foodDetail.value = DetailFoodModel.fromJson(json.decode(response.body));
      } else {
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("Error fetching food details: $e");
    } finally {
      isLoading(false);
    }
  }
}
