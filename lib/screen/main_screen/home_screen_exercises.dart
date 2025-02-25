import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:improve_me/config/common_widget/button_widget/button_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/body_medium_text_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/body_small_text_widget.dart';
import 'package:improve_me/config/common_widget/text_widget/title_small_widget.dart';
import 'package:improve_me/controller/food_controller/food_controller.dart';
import 'package:improve_me/screen/detail_screen/profile_screen.dart';
import '../../common_module/authentication/log_in/login_screen.dart';
import '../../config/common_widget/text_widget/title_large_widget.dart';
import '../../config/images/image.dart';
import '../../controller/exercise_controller/exercise_controller.dart';
import '../detail_screen/detail_food_screen.dart';
import '../detail_screen/setting_and_profile_screen.dart';
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
  RxInt currentTab = 0.obs;
  late RxString userName = "".obs;
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
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: currentTab.value,
          onTap: (int newIndex) {
            setState(() {
              currentTab.value = newIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
          unselectedIconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          fixedColor: Theme.of(context).appBarTheme.iconTheme?.color,
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
        );
      }),
      body: <Widget>[
        /// Home screen
        Obx(
          () {
            if (exerciseController.isLoading.value) {
              return Padding(padding: EdgeInsets.all(20.0), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
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
                      hintStyle: TextStyle(color: Colors.black),
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
                  Expanded(child: Center( child: CircularProgressIndicator(),)),
                ],
              ),);
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
                          hintStyle: TextStyle(color: Colors.black),
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
                                  width: 280,
                                  height: 280,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
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
                                          backgroundColor:
                                              Colors.blueGrey.shade50,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // Adjust radius as needed
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: SizedBox(
                                            height: 230,
                                            width: 230,
                                            child: Image.network(
                                              "${exerciseController.imageExercise(index)}",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Flexible(
                                        child: TitleSmallWidget(
                                            data: exerciseController
                                                    .exercises[index].name
                                                    .toString()
                                                    .capitalizeFirst ??
                                                ""),
                                      ),
                                    ],
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
              return Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20), child: Column(
                children: [
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
                        hintStyle: TextStyle(color: Colors.black),
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
                  Expanded(child: Center(child: CircularProgressIndicator(),)),
                ],
              ),);
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
                          hintStyle: TextStyle(color: Colors.black),
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
                      height: 20,
                    ),

                    /// list of food
                    Expanded(
                      child: foodController.foodList.isEmpty
                          ? Center(
                              child: TitleLargeWidget(
                                data: 'Please enter keto food only!',
                              ),
                            )
                          : ListView.builder(
                              itemCount: foodController.foodList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 280,
                                  width: 250,
                                  child: Column(
                                    children: [
                                      ElevatedButton(
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
                                        child:

                                            /// food image
                                            SizedBox(
                                          height: 220,
                                          width: 250,
                                          child: Image.network(
                                            foodController.foodList[index].image
                                                .toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),

                                      /// food name
                                      SizedBox(
                                        width: 250,
                                        child: Center(
                                          child: TitleSmallWidget(
                                            data: foodController
                                                .foodList[index].recipe
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ],
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
        // Padding(
        //   padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       TitleLargeWidget(data: "profile"),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           SizedBox(
        //             width: 20,
        //           ),
        //
        //           /// avatar
        //           Icon(
        //             Icons.account_circle,
        //             size: 80,
        //           ),
        //
        //           SizedBox(
        //             width: 30,
        //           ),
        //
        //           /// name
        //           TitleLargeWidget(data: "Hoang An"),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 25,
        //       ),
        //       Expanded(
        //         child: ListView(
        //           physics: NeverScrollableScrollPhysics(),
        //           children: [
        //             Column(
        //               children: [
        //                 /// profile button
        //                 SizedBox(
        //                   height: 60,
        //                   width: 300,
        //                   child: ButtonWidget(
        //                     data: "editingProfile",
        //                     onPressed: () {
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => (const ProfileScreen()),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //
        //                 /// Setting button
        //                 SizedBox(
        //                   height: 60,
        //                   width: 300,
        //                   child: ButtonWidget(
        //                     data: "setting",
        //                     onPressed: () {
        //                       Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                           builder: (context) => (const SettingScreen()),
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ),
        //                 const SizedBox(
        //                   height: 15,
        //                 ),
        //
        //                 /// log out button
        //                 SizedBox(
        //                     height: 60,
        //                     width: 300,
        //                     child: ButtonWidget(
        //                       data: "logout",
        //                       onPressed: () {
        //                         Navigator.pushAndRemoveUntil(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) =>
        //                                     (const LoginScreen())),
        //                             (route) => false);
        //                       },
        //                     )),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        SettingAndProfileScreen(),
      ][currentTab.value],
    );
  }
}
