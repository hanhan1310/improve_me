import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/common_widget/button_widget/button_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/body_medium_text_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/body_small_text_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/title_small_widget.dart';
import 'package:improve_me/controller/exercise_controller/exercise_controller.dart';
import 'package:improve_me/controller/sign_up_controller/sign_up_controller.dart';
import 'package:improve_me/utils/firebase_storage.dart';

import '../../config/common_widget/text_widget/title_large_widget.dart';
import 'exercise_detail_screen.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final ExercisesController _exercisesController =
      Get.put(ExercisesController());
  final SignUpController _signUpController = Get.put(SignUpController());
  final FirestoreService _firestoreService = FirestoreService();
  late TextEditingController _selectingDateController;
  final RxList<String> exerciseNames = <String>[].obs;
  final RxString exerciseDetail = "".obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exercisesController;
    _signUpController;
    _selectingDateController = TextEditingController();
    _firestoreService;
    _fetchExercises();
  }

  Future<void> _fetchExercises() async {
    final userId = _signUpController.currentUser?.uid;
    if (userId != null && userId.isNotEmpty) {
      _firestoreService.getExercises(userId).listen((exercises) {
        exerciseNames.value = exercises
            .map((exercise) => exercise.name ?? "Unknown")
            .toSet()
            .toList();
      });
    } else {
      print("User ID not available");
    }
  }

  Future<void> _selectDate() async {
    DateTime? _pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (_pickedDate != null) {
      _selectingDateController.text = _pickedDate.toString().split(" ")[0];
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    final exerciseCounts = _exercisesController.exerciseCounts;
    return Obx(
      () {
        if (exerciseCounts.isEmpty) {
          return Text("You haven't work-out yet!");
        }
        print(exerciseCounts.entries.toList());
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [

              // TextFormField(
              //   controller: _selectingDateController,
              //   readOnly: true,
              //   decoration: InputDecoration(
              //       labelText: "date".tr,
              //       prefixIcon: Icon(Icons.calendar_today),
              //       enabledBorder:
              //           OutlineInputBorder(borderSide: BorderSide.none),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xffA3EAFF)),
              //       )),
              //   onTap: _selectDate,
              // ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// piechart
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: PieChart(
                            swapAnimationCurve: Curves.easeInOut,
                            swapAnimationDuration: Duration(milliseconds: 500),
                            PieChartData(
                              sections: exerciseCounts.entries.map((entry) {
                                final value = entry.value.toDouble();
                                return PieChartSectionData(
                                    value: value,
                                    color: getColor(entry.key),
                                    title: entry.key.capitalizeFirst,
                                    titleStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ));
                              }).toList(),
                            ),
                          ),
                        ),

                        /// exercise bodypart name
                        SizedBox(
                          height: 230,
                          width: 100,
                          child: ListView.builder(
                            itemCount: exerciseCounts.entries.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: getColor(exerciseCounts
                                                  .keys
                                                  .toList()[index]),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        TitleSmallWidget(
                                            data: exerciseCounts.keys
                                                    .toList()[index]
                                                    .capitalizeFirst ??
                                                ""),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              TitleLargeWidget(data: "thisIsStatistic"),
              // Text("thisIsStatistic".tr, style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 170,
                child: Obx(() {
                  if (exerciseNames.isEmpty) {
                    return TitleSmallWidget(data: "noExercise");
                  }
                  return ListView.builder(
                    key: Key(exerciseNames.toString()),
                    itemCount: exerciseNames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ButtonWidget(
                          data: exerciseNames[index],
                          onPressed: () async {
                            exerciseDetail.value = exerciseNames[index];
                            if(exerciseDetail.value.toLowerCase() == "3/4 sit-up"){
                              await _exercisesController.fetchExercises(
                                query: "",
                              );
                              print(exerciseDetail.value);
                            }
                            else {
                              await _exercisesController.fetchExercises(
                                query: exerciseDetail.value.toLowerCase(),
                              );
                              print(exerciseDetail.value);
                            }
                            Get.to(
                              () => ExerciseDetailScreen(getData: 0),
                            )?.then((_) {
                              _exercisesController.fetchExercises(query: "");
                            });
                          },
                        ),
                      );
                    },
                  );
                },),
              ),
            ],
          ),
        );
      },
    );
  }
}

Color getColor(String bodyPart) {
  switch (bodyPart) {
    case 'pectorals':
      return Colors.red;
    case 'leg':
      return Colors.blue;
    case 'biceps':
      return Colors.green;
    case 'triceps':
      return Colors.yellowAccent;
    case 'abs':
      return Colors.orange;
    case 'back':
      return Colors.purple;
    case 'shoulder':
      return Colors.teal;
    default:
      return Colors.grey;
  }
}
