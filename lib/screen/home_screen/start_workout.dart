import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:improve_me/screen/home_screen/home_screen_exercises.dart';

import '../../config/images/image.dart';

class StartWorkout extends StatefulWidget {
  const StartWorkout({super.key});

  @override
  State<StartWorkout> createState() => _StartWorkoutState();
}

class _StartWorkoutState extends State<StartWorkout> {
  int countdown = 90;

  void counting() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Congratuation()),
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
            Image.network("https://v2.exercisedb.io/image/8-asN9xlY21elv"),
            Container(
              child: Text(
                countdown == 0 ? "0s" : "${countdown.toString()}s",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffA3EAFF),
                ),
                onPressed: counting,
                child: Text(
                  countdown == 0 ? "Done" : "Start",
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
          SizedBox(
            height: 10,
          ),
          Text(
            "Congratuation",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      nextScreen: HomeScreenExercises(),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
