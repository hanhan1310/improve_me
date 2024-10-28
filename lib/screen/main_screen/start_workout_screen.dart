import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../config/images/image.dart';
import 'home_screen_exercises.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({super.key});

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  int countdown = 90;

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
            Image.network("https://v2.exercisedb.io/image/tyKxriZAglPqts"),
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
                  countdown == 0 ? "Done" : "Start",
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
