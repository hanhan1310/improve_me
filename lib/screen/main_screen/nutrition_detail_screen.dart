import 'package:flutter/material.dart';


class NutritionDetailScreen extends StatefulWidget {
  const NutritionDetailScreen({super.key});

  @override
  State<NutritionDetailScreen> createState() => _NutritionDetailScreenState();
}

class _NutritionDetailScreenState extends State<NutritionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ground beef meatballs",
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network("https://cdn0.recetasgratis.net/es/posts/9/7/9/albondigas_de_carne_molida_45979_600.jpg", fit: BoxFit.fill,)),
              const SizedBox(
                height: 5,
              ),
              const Text("Serving: Plate for 2 people"),
              const SizedBox(height: 5,),
              const Text("Duration: 30 minutes"),
              const SizedBox(height: 5,),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ingredientes: "),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
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
                ],
              ),
              const SizedBox(height: 5,),
              const Flexible(
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
      ),
    );
  }
}
