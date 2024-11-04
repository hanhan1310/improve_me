class FoodModel {
  int? s;
  List<D>? d;
  int? t;
  P? p;

  FoodModel({this.s, this.d, this.t, this.p});

  FoodModel.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    if (json['d'] != null) {
      d = <D>[];
      json['d'].forEach((v) {
        d!.add(new D.fromJson(v));
      });
    }
    t = json['t'];
    p = json['p'] != null ? new P.fromJson(json['p']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    data['t'] = this.t;
    if (this.p != null) {
      data['p'] = this.p!.toJson();
    }
    return data;
  }
}

class D {
  int? id;
  String? title;
  Ingredients? ingredients;
  String? instructions;
  String? image;

  D({this.id, this.title, this.ingredients, this.instructions, this.image});

  D.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    ingredients = json['Ingredients'] != null
        ? new Ingredients.fromJson(json['Ingredients'])
        : null;
    instructions = json['Instructions'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    if (this.ingredients != null) {
      data['Ingredients'] = this.ingredients!.toJson();
    }
    data['Instructions'] = this.instructions;
    data['Image'] = this.image;
    return data;
  }
}

class Ingredients {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? s15;
  String? s16;
  String? s17;
  String? s18;
  String? s19;
  String? s20;
  String? s21;
  String? s22;
  String? s23;
  String? s24;
  String? s25;
  String? s26;
  String? s27;
  String? s28;
  String? s29;

  Ingredients(
      {this.s1,
        this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s7,
        this.s8,
        this.s9,
        this.s10,
        this.s11,
        this.s12,
        this.s13,
        this.s14,
        this.s15,
        this.s16,
        this.s17,
        this.s18,
        this.s19,
        this.s20,
        this.s21,
        this.s22,
        this.s23,
        this.s24,
        this.s25,
        this.s26,
        this.s27,
        this.s28,
        this.s29});

  Ingredients.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    s17 = json['17'];
    s18 = json['18'];
    s19 = json['19'];
    s20 = json['20'];
    s21 = json['21'];
    s22 = json['22'];
    s23 = json['23'];
    s24 = json['24'];
    s25 = json['25'];
    s26 = json['26'];
    s27 = json['27'];
    s28 = json['28'];
    s29 = json['29'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['16'] = this.s16;
    data['17'] = this.s17;
    data['18'] = this.s18;
    data['19'] = this.s19;
    data['20'] = this.s20;
    data['21'] = this.s21;
    data['22'] = this.s22;
    data['23'] = this.s23;
    data['24'] = this.s24;
    data['25'] = this.s25;
    data['26'] = this.s26;
    data['27'] = this.s27;
    data['28'] = this.s28;
    data['29'] = this.s29;
    return data;
  }
}

class P {
  int? limitstart;
  int? limit;
  int? total;
  int? pagesStart;
  int? pagesStop;
  int? pagesCurrent;
  int? pagesTotal;

  P(
      {this.limitstart,
        this.limit,
        this.total,
        this.pagesStart,
        this.pagesStop,
        this.pagesCurrent,
        this.pagesTotal});

  P.fromJson(Map<String, dynamic> json) {
    limitstart = json['limitstart'];
    limit = json['limit'];
    total = json['total'];
    pagesStart = json['pagesStart'];
    pagesStop = json['pagesStop'];
    pagesCurrent = json['pagesCurrent'];
    pagesTotal = json['pagesTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limitstart'] = this.limitstart;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['pagesStart'] = this.pagesStart;
    data['pagesStop'] = this.pagesStop;
    data['pagesCurrent'] = this.pagesCurrent;
    data['pagesTotal'] = this.pagesTotal;
    return data;
  }
}
