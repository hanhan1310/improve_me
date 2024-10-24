import 'package:flutter/material.dart';
import 'package:improve_me/screen/new_user_screen/question_1.dart';
import 'package:improve_me/widget/button_widget.dart';

class PersonalGoalScreen extends StatefulWidget {
  const PersonalGoalScreen({super.key});

  @override
  State<PersonalGoalScreen> createState() => _Screen1State();
}

class _Screen1State extends State<PersonalGoalScreen> {
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
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("Get fit", Question1()),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("Gain weight", Question1()),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("Loose weight", Question1()),
            ),
          ],
        ),
      ),
    );
  }
}
