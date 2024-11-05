import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/food_controller/detail_food_controller.dart';

class DetailFoodScreen extends StatefulWidget {
  final String foodId;

  const DetailFoodScreen({required this.foodId, super.key});

  @override
  State<DetailFoodScreen> createState() => _DetailFoodScreenState();
}

class _DetailFoodScreenState extends State<DetailFoodScreen> {
  late DetailFoodController detailFoodController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailFoodController = Get.put(DetailFoodController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
        if (detailFoodController.isLoading == true) {
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
                    "${detailFoodController.foodDetail.value.title}", style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.network(
                          "${detailFoodController.foodDetail.value.image}",
                          fit: BoxFit.fill,
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Serving: ${detailFoodController.foodDetail.value.portion}"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "Duration: ${detailFoodController.foodDetail.value.time}"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ingredientes: "),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("500 grams of ground beef"),
                            Text("2 eggs"),
                            Text("1 onion"),
                            Text("3 tablespoons breadcrumbs"),
                            Text("Flour"),
                            Text("1 pinch of oregano"),
                            Text("1 pinch of garlic powder"),
                            Text("1 tablespoon fresh parsley"),
                            Text("salt (to taste)"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Flexible(
                      child: Text(
                          "Instructions: To make these homemade meatballs you can use "
                          "beef or ask for a mix of beef and pork at the butcher shop. "
                          "If you decide on this last option, the ideal proportion is 70% beef and 25% pork. "
                          "The mixture will make the meatballs juicier thanks to the pork. And if you prefer to use chicken meat, then check out the chicken meatballs recipe."
                          "To start the meatball recipe, place the meat in a large enough bowl and knead it together with the eggs, breadcrumbs, onion, seasonings and parsley. "
                          "The onion and parsley must be finely chopped. "
                          "If you are allergic to eggs you can do without this ingredient."))
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
