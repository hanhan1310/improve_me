class DetailFoodModel {
  String? id;
  String? title;
  String? difficulty;
  String? portion;
  String? time;
  String? description;
  List<String>? ingredients;
  List<Method>? method;
  String? image;

  DetailFoodModel(
      {this.id,
        this.title,
        this.difficulty,
        this.portion,
        this.time,
        this.description,
        this.ingredients,
        this.method,
        this.image});

  DetailFoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    difficulty = json['difficulty'];
    portion = json['portion'];
    time = json['time'];
    description = json['description'];
    ingredients = json['ingredients'].cast<String>();
    if (json['method'] != null) {
      method = <Method>[];
      json['method'].forEach((v) {
        method!.add(new Method.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['difficulty'] = this.difficulty;
    data['portion'] = this.portion;
    data['time'] = this.time;
    data['description'] = this.description;
    data['ingredients'] = this.ingredients;
    if (this.method != null) {
      data['method'] = this.method!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}

class Method {
  String? step1;
  String? step2;
  String? step3;
  String? step4;
  String? step5;
  String? step6;


  Method(
      {this.step1, this.step2, this.step3, this.step4, this.step5, this.step6});

  Method.fromJson(Map<String, dynamic> json) {
    step1 = json['Step 1'];
    step2 = json['Step 2'];
    step3 = json['Step 3'];
    step4 = json['Step 4'];
    step5 = json['Step 5'];
    step6 = json['Step 6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Step 1'] = this.step1;
    data['Step 2'] = this.step2;
    data['Step 3'] = this.step3;
    data['Step 4'] = this.step4;
    data['Step 5'] = this.step5;
    data['Step 6'] = this.step6;
    return data;
  }
}
