import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/controller/exercise_controller/exercise_controller.dart';
import 'package:improve_me/screen/main_screen/start_workout_screen.dart';

class ExerciseDetailScreen extends StatefulWidget {
  int getData;

  ExerciseDetailScreen({super.key, required this.getData});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetailScreen> {
  late ExercisesController _exerciseController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exerciseController = Get.put(ExercisesController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
          if (_exerciseController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  /// exercise name
                  Text(
                    "${_exerciseController.nameDetail(widget.getData)}",
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /// exercise image
                  Image.network(
                      "${_exerciseController.imageExercise(widget.getData)}"),
                  const SizedBox(
                    height: 5,
                  ),

                  /// target muscle
                  Text(
                      "Target Muscle: ${_exerciseController.targetMuscle(widget.getData)}"),
                  const SizedBox(
                    height: 5,
                  ),

                  /// secondary muscles
                  const Text("Secondary muscles:"),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _exerciseController
                          .secondaryMuscles(widget.getData)
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "- ${_exerciseController.secondaryMuscles(widget.getData)[index]}",
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  /// equipment
                  Text(
                      "Equipment: ${_exerciseController.equipment(widget.getData)}"),
                  const SizedBox(
                    height: 5,
                  ),

                  ///instructions
                  const Text(
                    "Instructions: ",

                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _exerciseController
                          .instructionExercise(widget.getData)
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "- ${_exerciseController.instructionExercise(widget.getData)[index]}",
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (StartWorkoutScreen(
                        getData: widget.getData,
                      ))));
        },
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffA3EAFF)),
        child: const Text(
          "Start workout",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
