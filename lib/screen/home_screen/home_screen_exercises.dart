import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/common_widget/text_widget.dart';
import '../../controller/exercise_controller/exercise_controller.dart';
import '../../service/api_service/api_service.dart';
import 'exercise_detail.dart';

class HomeScreenExercises extends StatefulWidget {
  const HomeScreenExercises({super.key});

  @override
  State<HomeScreenExercises> createState() => _HomeScreenExercisesState();
}

class _HomeScreenExercisesState extends State<HomeScreenExercises> {
  late ExerciseController exerciseController;
  int currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exerciseController = Get.put(ExerciseController(apiService: ApiService()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Improve Me",
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int newIndex) {
          setState(() {
            currentTab = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: const Color(0xffA3EAFF),
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "Nutrition",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "Statistic",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: TextWidget("Searching..."),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Exercises",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => (ExerciseDetail())));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey.shade50,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("Bench press:"), Text("Chest")],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
