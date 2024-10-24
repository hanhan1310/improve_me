import 'package:flutter/material.dart';
import 'package:improve_me/screen/splash_screen.dart';
import 'package:improve_me/widget/button_widget.dart';

import '../home_screen/home_screen_exercises.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Screen1State();
}

class _Screen1State extends State<Question2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Goal",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Flexible(
              child: Text(
                "Where do you usually workout ?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("Gym", HomeScreenExercises()),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("Home", HomeScreenExercises()),
            ),
          ],
        ),
      ),
    );
  }
}
