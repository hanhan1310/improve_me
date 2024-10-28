import 'package:flutter/material.dart';
import 'package:improve_me/screen/main_screen/start_workout_screen.dart';

class ExerciseDetail extends StatefulWidget {
  const ExerciseDetail({super.key});

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bench press",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffA3EAFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network("https://v2.exercisedb.io/image/tyKxriZAglPqts"),
              SizedBox(
                height: 5,
              ),
              Text("Target: Pectorals"),
              SizedBox(
                height: 5,
              ),
              Text("Secondary muscles: Triceps, Shoudlers"),
              SizedBox(
                height: 5,
              ),
              Text("Reps/Sets: 8 reps / 3 sets"),
              SizedBox(
                height: 5,
              ),
              Flexible(
                  child: Text(
                      "Instructions: Lie flat on a bench with your feet flat on the ground and your back pressed against the bench, Grasp the band h"
                      "andles with an overhand grip, slightly wider than shoulder-width apart, Extend your arms fully, pushing the bands away from your chest, "
                      "Slowly lower the bands back down to your chest, keeping your elbows at a 90 degree angle, Repeat for the desired number of repetitions."))
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => (StartWorkout())));
      }, child: Text("Start workout", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(backgroundColor: Color(0xffA3EAFF)),),
    );
  }
}
