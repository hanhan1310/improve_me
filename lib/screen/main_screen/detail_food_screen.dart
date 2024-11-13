import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/food_controller/food_controller.dart';
import '../../model/food_model.dart';

class DetailFoodScreen extends StatefulWidget {

  const DetailFoodScreen({super.key});

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  late FoodController detailFoodController;
  int foodId = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailFoodController = Get.put(FoodController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Food Detail",
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
      body: Obx(() {
        if (detailFoodController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (detailFoodController.foodList.value == null) {
          print(foodId);

          return Center(child: Text("No details found."));
        } else {
          print("toi day roi");

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    detailFoodController.nameFoodDetail(foodId).toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.network(
                          "${detailFoodController.foodList[foodId].image?.trim()}",
                          fit: BoxFit.fill,
                        ),
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Serving: ${detailFoodController.foodList[foodId].serving}"),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Duration: ${detailFoodController.foodList[foodId].cookTimeInMinutes}"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Ingredientes: "),
                  SizedBox(height: 5),
                  ..._getIngredientsList(detailFoodController.foodList[foodId]),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Rescipe: "),
                  SizedBox(height: 5),
                  ..._getDirectionsList(detailFoodController.foodList[foodId]),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
  // Helper function to get list of ingredients
  List<Widget> _getIngredientsList(FoodModel food) {
    return [
      food.ingredient1, food.ingredient2, food.ingredient3, food.ingredient4, food.ingredient5,
      food.ingredient6, food.ingredient7, food.ingredient8, food.ingredient9, food.ingredient10
    ]
        .where((ingredient) => ingredient != null && ingredient.isNotEmpty) // Filter non-null and non-empty ingredients
        .map((ingredient) => Text("- $ingredient"))
        .toList();
  }

  // Helper function to get list of directions
  List<Widget> _getDirectionsList(FoodModel food) {
    return [
      food.directionsStep1, food.directionsStep2, food.directionsStep3, food.directionsStep4, food.directionsStep5,
      food.directionsStep6, food.directionsStep7, food.directionsStep8, food.directionsStep9, food.directionsStep10
    ]
        .where((step) => step != null && step.isNotEmpty) // Filter non-null and non-empty steps
        .map((step) => Text("- $step"))
        .toList();
  }
}
