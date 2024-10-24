import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ControllerProject extends GetxController {
  Future<void> fetchExercises() async {
    final response = await http.get(
      Uri.parse('https://exercisedb.p.rapidapi.com/exercises'),
      headers: {
        'X-RapidAPI-Key': 'YOUR_API_KEY',
        'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchExercises();
  }
}
