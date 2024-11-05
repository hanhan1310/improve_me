import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/controller/exercise_controller/exercise_controller.dart';
import 'package:improve_me/screen/main_screen/start_workout_screen.dart';

class ExerciseDetail extends StatefulWidget {
  int getData;

  ExerciseDetail({super.key, required this.getData});

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  late ChestExercisesController _exerciseController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exerciseController = Get.put(ChestExercisesController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Exercise Detail",
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
      body: Obx(
        () {
          if (_exerciseController.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${_exerciseController.nameDetail(widget.getData)}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                        "${_exerciseController.imageExercise(widget.getData)}"),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "Target: ${_exerciseController.targetMuscle(widget.getData)}"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Secondary muscles: Triceps, Shoudlers"),
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
            );
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (StartWorkout())));
        },
        child: Text(
          "Start workout",
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffA3EAFF)),
      ),
    );
  }
}
