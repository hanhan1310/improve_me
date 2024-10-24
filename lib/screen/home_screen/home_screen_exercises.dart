import 'package:flutter/material.dart';
import 'package:improve_me/widget/text_widget.dart';

class HomeScreenExercises extends StatefulWidget {
  const HomeScreenExercises({super.key});

  @override
  State<HomeScreenExercises> createState() => _HomeScreenExercisesState();
}

class _HomeScreenExercisesState extends State<HomeScreenExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Improve Me",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffA3EAFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: TextWidget("Searching..."),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Exercises", style: TextStyle(fontSize: 15, color: Colors.blueGrey[400],),),
            SizedBox(height: 25,),

          ],
        ),
      ),
    );
  }
}
