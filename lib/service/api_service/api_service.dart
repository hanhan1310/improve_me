import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://exercisedb.p.rapidapi.com/exercises/name/chest?offset=0&limit=20';
    _dio.options.headers = {
      'X-RapidAPI-Key': '44f58e748cmsh5fd7504f4c089f0p1479fdjsnbd20fe5a98c5',
      'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
    };
  }

  Future<List<dynamic>> fetchExercises() async {
    try {
      final response = await _dio.get('/exercises');
      return response.data;
    } catch (e) {
      throw Exception('Failed to load exercises');
    }
  }
}
