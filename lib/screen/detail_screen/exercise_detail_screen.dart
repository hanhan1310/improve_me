import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/controller/exercise_controller/exercise_controller.dart';
import 'package:improve_me/controller/sign_up_controller/sign_up_controller.dart';
import 'package:improve_me/model/authentication_model.dart';
import 'package:improve_me/screen/detail_screen/start_workout_screen.dart';
import 'package:improve_me/utils/authentication_service.dart';
import 'package:improve_me/utils/firebase_storage.dart';

class ExerciseDetailScreen extends StatefulWidget {
  int getData;

  ExerciseDetailScreen({super.key, required this.getData});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetailScreen> {
  late ExercisesController _exerciseController;
  final FirestoreService firestoreService = FirestoreService();
  final SignUpController signUpController = Get.put(SignUpController());



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
        title: Text(
          "exerciseDetail".tr,
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
                  Row(
                    children: [
                      Text(
                          "targetMuscle".tr),
                      SizedBox(width: 5,),
                      Text("${_exerciseController.targetMuscle(widget.getData)}"),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  /// secondary muscles
                  Text("secondaryMuscles".tr),
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
                  Row(
                    children: [
                      Text(
                          "equipment".tr),
                      SizedBox(width: 5,),
                      Text("${_exerciseController.equipment(widget.getData)}"),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  ///instructions
                  Text(
                    "instructions".tr,

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

      /// button start
      floatingActionButton: ElevatedButton(
        onPressed: () {
          firestoreService.addExercises(id: _exerciseController.exercises[widget.getData].id ?? "",name: _exerciseController.nameDetail(widget.getData) ?? "",bodyPart:  _exerciseController.targetMuscle(widget.getData) ?? "",idUser: signUpController.currentUser?.uid ?? "");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => (StartWorkoutScreen(
                        getData: widget.getData,
                      ))));
        },
        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffA3EAFF)),
        child: Text(
          "startWorkout".tr,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
