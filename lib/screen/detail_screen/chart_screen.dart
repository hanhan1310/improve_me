import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:improve_me/controller/exercise_controller/exercise_controller.dart';
import 'package:improve_me/controller/sign_up_controller/sign_up_controller.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final ExercisesController _exercisesController =
  Get.put(ExercisesController());
  final SignUpController _signUpController = Get.put(SignUpController());
  late TextEditingController _selectingDateController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _exercisesController;
    _signUpController;
    _selectingDateController = TextEditingController();
    final userId = _signUpController.currentUser?.uid;
    if (userId != null && userId.isNotEmpty) {
      _exercisesController.fetchFirestoreExercises(userId: userId);
    } else {
      print("User ID not available");
    }

  }

  Future<void> _selectDate() async {
    DateTime? _pickedDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100), initialDate: DateTime.now());

    if(_pickedDate != null){
      _selectingDateController.text = _pickedDate.toString().split(" ")[0];
      Get.back();
    }
  }


  @override
  Widget build(BuildContext context) {
    final exerciseCounts = _exercisesController.exerciseCounts;
    return Obx(
          () {
            if(exerciseCounts.isEmpty) {
              return Text("You haven't work-out yet!");
            }
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _selectingDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "date".tr,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffA3EAFF)),
                  )
                ),
                onTap: _selectDate,
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: 200,
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
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                        /// exercise bodypart name
                        SizedBox(
                          height: 200,
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
                                              color: getColor(exerciseCounts.keys.toList()[index]),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(exerciseCounts.keys.toList()[index].capitalizeFirst ?? ""),
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
              SizedBox(height: 20,),
              Text("thisIsStatistic".tr),
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
