import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:improve_me/model/food_model.dart';

class FoodController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var foodList = <FoodModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFoodList();
  }

  static const String _baseUrl = 'https://keto-diet.p.rapidapi.com/';
  static const String _apiKey = '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5';


  Future<void> fetchFoodList({String? query}) async {
    try {
      isLoading(true);
      final url = query != null && query.isNotEmpty
          ? Uri.parse("$_baseUrl?search=$query")
          : Uri.parse("$_baseUrl");
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Key': _apiKey,
          'X-RapidAPI-Host': 'keto-diet.p.rapidapi.com',
        },
      );


      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        foodList.value = data.map((item) => FoodModel.fromJson(item)).toList();
        print("Thành công lấy data food");
      } else {
        print('Lỗi tải danh sách món ăn');
      }
    } catch (e, stackTrace) {
      print("StackTrace: $stackTrace");
    } finally {
      isLoading(false);
    }
  }
}
