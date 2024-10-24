import 'package:flutter/material.dart';
import 'package:improve_me/screen/new_user_screen/question_2.dart';
import 'package:improve_me/widget/button_widget.dart';

class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Screen1State();
}

class _Screen1State extends State<Question1> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(
              child: Text(
                "How often does you get exercise perday",
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
              child: ButtonWidget("0 - 15 minutes", Question2()),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("15 - 30 minutes", Question2()),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: ButtonWidget("30 - 60 minutes", Question2()),
            ),
          ],
        ),
      ),
    );
  }
}
