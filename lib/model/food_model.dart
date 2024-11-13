class FoodModel {
  int? id;
  String? recipe;
  Category? category;
  int? prepTimeInMinutes;
  String? prepTimeNote;
  int? cookTimeInMinutes;
  Null cookTimeNote;
  String? difficulty;
  int? serving;
  double? measurement1;
  double? measurement2;
  double? measurement3;
  double? measurement4;
  double? measurement5;
  double? measurement6;
  double? measurement7;
  double? measurement8;
  double? measurement9;
  double? measurement10;
  String? ingredient1;
  String? ingredient2;
  String? ingredient3;
  String? ingredient4;
  String? ingredient5;
  String? ingredient6;
  String? ingredient7;
  String? ingredient8;
  String? ingredient9;
  String? ingredient10;
  String? directionsStep1;
  String? directionsStep2;
  String? directionsStep3;
  String? directionsStep4;
  String? directionsStep5;
  String? directionsStep6;
  String? directionsStep7;
  String? directionsStep8;
  String? directionsStep9;
  String? directionsStep10;
  String? image;
  Null imageAttributionName;
  Null imageAttributionUrl;
  bool? imageCreativeCommons;
  Null chef;
  Null sourceUrl;
  double? calories;
  double? fatInGrams;
  double? carbohydratesInGrams;
  double? proteinInGrams;

  FoodModel(
      {this.id,
        this.recipe,
        this.category,
        this.prepTimeInMinutes,
        this.prepTimeNote,
        this.cookTimeInMinutes,
        this.cookTimeNote,
        this.difficulty,
        this.serving,
        this.measurement1,
        this.measurement2,
        this.measurement3,
        this.measurement4,
        this.measurement5,
        this.measurement6,
        this.measurement7,
        this.measurement8,
        this.measurement9,
        this.measurement10,
        this.ingredient1,
        this.ingredient2,
        this.ingredient3,
        this.ingredient4,
        this.ingredient5,
        this.ingredient6,
        this.ingredient7,
        this.ingredient8,
        this.ingredient9,
        this.ingredient10,
        this.directionsStep1,
        this.directionsStep2,
        this.directionsStep3,
        this.directionsStep4,
        this.directionsStep5,
        this.directionsStep6,
        this.directionsStep7,
        this.directionsStep8,
        this.directionsStep9,
        this.directionsStep10,
        this.image,
        this.imageAttributionName,
        this.imageAttributionUrl,
        this.imageCreativeCommons,
        this.chef,
        this.sourceUrl,
        this.calories,
        this.fatInGrams,
        this.carbohydratesInGrams,
        this.proteinInGrams});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipe = json['recipe'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    prepTimeInMinutes = json['prep_time_in_minutes'];
    prepTimeNote = json['prep_time_note'];
    cookTimeInMinutes = json['cook_time_in_minutes'];
    cookTimeNote = json['cook_time_note'];
    difficulty = json['difficulty'];
    serving = json['serving'];
    measurement1 = json['measurement_1'];
    measurement2 = json['measurement_2'];
    measurement3 = json['measurement_3'];
    measurement4 = json['measurement_4'];
    measurement5 = json['measurement_5'];
    measurement6 = json['measurement_6'];
    measurement7 = json['measurement_7'];
    measurement8 = json['measurement_8'];
    measurement9 = json['measurement_9'];
    measurement10 = json['measurement_10'];
    ingredient1 = json['ingredient_1'];
    ingredient2 = json['ingredient_2'];
    ingredient3 = json['ingredient_3'];
    ingredient4 = json['ingredient_4'];
    ingredient5 = json['ingredient_5'];
    ingredient6 = json['ingredient_6'];
    ingredient7 = json['ingredient_7'];
    ingredient8 = json['ingredient_8'];
    ingredient9 = json['ingredient_9'];
    ingredient10 = json['ingredient_10'];
    directionsStep1 = json['directions_step_1'];
    directionsStep2 = json['directions_step_2'];
    directionsStep3 = json['directions_step_3'];
    directionsStep4 = json['directions_step_4'];
    directionsStep5 = json['directions_step_5'];
    directionsStep6 = json['directions_step_6'];
    directionsStep7 = json['directions_step_7'];
    directionsStep8 = json['directions_step_8'];
    directionsStep9 = json['directions_step_9'];
    directionsStep10 = json['directions_step_10'];
    image = json['image'];
    imageAttributionName = json['image_attribution_name'];
    imageAttributionUrl = json['image_attribution_url'];
    imageCreativeCommons = json['image_creative_commons'];
    chef = json['chef'];
    sourceUrl = json['source_url'];
    calories = json['calories'];
    fatInGrams = json['fat_in_grams'];
    carbohydratesInGrams = json['carbohydrates_in_grams'];
    proteinInGrams = json['protein_in_grams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipe'] = recipe;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['prep_time_in_minutes'] = prepTimeInMinutes;
    data['prep_time_note'] = prepTimeNote;
    data['cook_time_in_minutes'] = cookTimeInMinutes;
    data['cook_time_note'] = cookTimeNote;
    data['difficulty'] = difficulty;
    data['serving'] = serving;
    data['measurement_1'] = measurement1;
    data['measurement_2'] = measurement2;
    data['measurement_3'] = measurement3;
    data['measurement_4'] = measurement4;
    data['measurement_5'] = measurement5;
    data['measurement_6'] = measurement6;
    data['measurement_7'] = measurement7;
    data['measurement_8'] = measurement8;
    data['measurement_9'] = measurement9;
    data['measurement_10'] = measurement10;
    data['ingredient_1'] = ingredient1;
    data['ingredient_2'] = ingredient2;
    data['ingredient_3'] = ingredient3;
    data['ingredient_4'] = ingredient4;
    data['ingredient_5'] = ingredient5;
    data['ingredient_6'] = ingredient6;
    data['ingredient_7'] = ingredient7;
    data['ingredient_8'] = ingredient8;
    data['ingredient_9'] = ingredient9;
    data['ingredient_10'] = ingredient10;
    data['directions_step_1'] = directionsStep1;
    data['directions_step_2'] = directionsStep2;
    data['directions_step_3'] = directionsStep3;
    data['directions_step_4'] = directionsStep4;
    data['directions_step_5'] = directionsStep5;
    data['directions_step_6'] = directionsStep6;
    data['directions_step_7'] = directionsStep7;
    data['directions_step_8'] = directionsStep8;
    data['directions_step_9'] = directionsStep9;
    data['directions_step_10'] = directionsStep10;
    data['image'] = image;
    data['image_attribution_name'] = imageAttributionName;
    data['image_attribution_url'] = imageAttributionUrl;
    data['image_creative_commons'] = imageCreativeCommons;
    data['chef'] = chef;
    data['source_url'] = sourceUrl;
    data['calories'] = calories;
    data['fat_in_grams'] = fatInGrams;
    data['carbohydrates_in_grams'] = carbohydratesInGrams;
    data['protein_in_grams'] = proteinInGrams;
    return data;
  }
}

class Category {
  int? id;
  String? category;
  String? thumbnail;

  Category({this.id, this.category, this.thumbnail});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
