import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController {
  final List<Map<String, dynamic>> changeLanguage = [
    {
      "name": "English",
      "local": const Locale("en", "US"),
    },
    {
      "name": "Vietnamese",
      "local": const Locale("vi", "VI"),
    },
  ];

}
