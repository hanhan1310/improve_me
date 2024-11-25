import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/theme/theme.dart';
import 'package:improve_me/firebase_options.dart';
import 'package:improve_me/screen/main_screen/home_screen_exercises.dart';
import 'common_module/splash_screen/splash_screen.dart';
import 'config/localization/local_string.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale("en", "US"),
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      // themeMode: ThemeMode.dark,
      home: const SplashScreen(),
      // home: const HomeScreenExercises(),
    );
  }
}