import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/controller/food_controller/food_controller.dart';
import 'package:improve_me/screen/detail_screen/profile_screen.dart';
import '../../common_module/authentication/log_in/login_screen.dart';
import '../../config/images/image.dart';
import '../../controller/exercise_controller/exercise_controller.dart';
import '../detail_screen/detail_food_screen.dart';
import '../detail_screen/setting_screen.dart';
import '../detail_screen/chart_screen.dart';
import '../detail_screen/exercise_detail_screen.dart';
import 'dart:async';

class HomeScreenExercises extends StatefulWidget {
  const HomeScreenExercises({super.key});

  @override
  State<HomeScreenExercises> createState() => _HomeScreenExercisesState();
}

class _HomeScreenExercisesState extends State<HomeScreenExercises> {
  late ExercisesController exerciseController;
  late FoodController foodController;

  final TextEditingController searching = TextEditingController();
  final TextEditingController searchingFood = TextEditingController();
  int currentTab = 0;
  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    exerciseController = Get.put(ExercisesController());
    foodController = Get.put(FoodController());
    searching;
    searchingFood;
    print("this is initstate home screen");
  }


  /// timer for searching exercises
  void _onSearchExerciseChanged() {
    final query = searching.text;

    // Cancel the previous debounce timer if any
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Set a new debounce timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        exerciseController
            .fetchExercises(); // Show all exercises when search is cleared
      } else {
        exerciseController.fetchExercises(query: query); // Perform search
      }
    });
  }

  void _onSearchNutritionChanged() {
    final query = searchingFood.text;

    // Cancel the previous debounce timer if any
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Set a new debounce timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        foodController
            .fetchFoodList(); // Show all exercises when search is cleared
      } else {
        foodController.fetchFoodList(query: query); // Perform search
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Improve Me",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
          color: Colors.blue,
        ),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xffA3EAFF),
        fixedColor: Colors.blue,
        items: [
          /// home
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "home".tr,
          ),

          /// nutrition
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "nutrition".tr,
          ),

          /// statistic
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: "statistic".tr,
          ),

          /// setting
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "setting".tr,
          ),
        ],
      ),
      body: <Widget>[
        /// Home screen
        Obx(
          () {
            if (exerciseController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// searching
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 12),
                        controller: searching,
                        onTapOutside: (even) {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (text) => _onSearchExerciseChanged(),
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "searching".tr,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffA3EAFF), width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    /// list work-out screen
                    Expanded(
                      child: ListView.builder(
                        itemCount: exerciseController.exercises.length,
                        itemBuilder: (BuildContext context, int index) {
                          /// default screen
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 250,
                                  height: 250,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  (ExerciseDetailScreen(
                                                    getData: index,
                                                  ))));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey.shade50,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Adjust radius as needed
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /// exercises image
                                        SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: Image.network(
                                              "${exerciseController.imageExercise(index)}",
                                              fit: BoxFit.cover,
                                            )),

                                        const SizedBox(
                                          height: 10,
                                        ),

                                        /// exercises name
                                        Flexible(
                                          child: Text(
                                            "${exerciseController.exercises[index].name.toString().capitalizeFirst}",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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

        /// Nutrition screen
        Obx(
          () {
            // Check if data is still loading
            if (foodController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Check if data is loaded but empty
            if (foodController.foodList.isEmpty) {
              return const Center(child: Text("No data available"));
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    /// searching
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 12),
                        controller: searchingFood,
                        onTapOutside: (even) {
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (text) => _onSearchNutritionChanged(),
                        autofocus: false,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "searching".tr,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffA3EAFF), width: 1.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    /// list of food
                    Expanded(
                      child: foodController.foodList.isEmpty
                          ? const Center(
                              child: Text(
                                "Please search for keto food only",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            )
                          : GridView.builder(
                              itemCount: foodController.foodList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // <-- Radius
                                      ),
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: () {
                                      Get.to(() => const DetailFoodScreen(),
                                          arguments: index);
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        /// food image
                                        SizedBox(
                                          height: 120,
                                          width: 130,
                                          child: Image.network(
                                            foodController.foodList[index].image
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 3,
                                        ),

                                        /// food name
                                        SizedBox(
                                            width: 130,
                                            child: Center(
                                                child: Text(
                                              foodController
                                                  .foodList[index].recipe
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black),
                                            ))),
                                      ],
                                    ),
                                  ),
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

        /// statistic screen
        ChartScreen(),

        /// setting screen
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "profile".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// avatar
                  CircleAvatar(
                    backgroundImage: AssetImage(Images.avatar),
                    minRadius: 60,
                  ),
                  /// name
                  const Text("Hoang An",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),

                ],
              ),

              const SizedBox(
                height: 35,
              ),

              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        /// profile button
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (const ProfileScreen()),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "editingProfile".tr,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// Setting button
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => (const SettingScreen()),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "setting".tr,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        /// log out button
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (const LoginScreen())),
                                  (route) => false);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "logout".tr,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
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
      ][currentTab],
    );
  }
}
