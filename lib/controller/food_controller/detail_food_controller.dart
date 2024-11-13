import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../model/food_model.dart';

class DetailFoodController extends GetxController {
  var isLoading = true.obs;
  var foodDetail = <FoodModel>[].obs;


  Future<void> fetchFoodDetail({int? id}) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://keto-diet.p.rapidapi.com/?id=$id'),
        headers: {
          'X-RapidAPI-Key': '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5',
          'X-RapidAPI-Host': 'keto-diet.p.rapidapi.com',
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        foodDetail.value = data.map((item) => FoodModel.fromJson(item)).toList();
        print("Thành công lấy data food");
      } else {
        print('Lỗi tải danh sách món ăn');
      }
    }catch (e, trackstage) {
      // Handle network errors
      print(e);
      print(trackstage);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFoodDetail();
  }
}
