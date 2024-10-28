import 'package:flutter/material.dart';
import '../../../config/common_widget/button_widget.dart';
import '../../../config/common_widget/text_widget.dart';
import '../../../screen/main_screen/home_screen_exercises.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personal Information",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              height: 45,
              width: 270,
              child: TextWidget("Username"),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              height: 45,
              width: 270,
              child: TextWidget("Password"),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              height: 45,
              width: 270,
              child: TextWidget("Name"),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Age"),
                  ),
                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Gender"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              width: 270,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Height"),
                  ),

                  SizedBox(
                    width: 125,
                    height: 45,
                    child: TextWidget("Weight"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ButtonWidget("Next", const HomeScreenExercises()),
            )
          ],
        ),
      ),
    );
  }
}
