import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/images/image.dart';
import '../../controller/exercise_controller/exercise_controller.dart';
import '../main_screen/home_screen_exercises.dart';

class StartWorkoutScreen extends StatefulWidget {
  int getData;
  StartWorkoutScreen({super.key, required this.getData});

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkoutScreen> {
  int countdown = 3;
  late ExercisesController _startExerciseController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startExerciseController = Get.put(ExercisesController());
  }
  void counting() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Congratuation()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(_startExerciseController.imageExercise(widget.getData).toString()),
            Text(
              countdown == 0 ? "0s" : "${countdown.toString()}s",
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA3EAFF),
                ),
                onPressed: counting,
                child: Text(
                  countdown == 0 ? "done".tr : "start".tr,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Congratuation extends StatefulWidget {
  const Congratuation({super.key});

  @override
  State<Congratuation> createState() => _CongratuationState();
}

class _CongratuationState extends State<Congratuation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Image(
              image: AssetImage(Images.congratuation),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Congratuation",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      nextScreen: const HomeScreenExercises(),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
