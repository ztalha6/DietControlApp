class DietDetails {
  Breakfast? breakfast;
  Breakfast? lunch;
  Breakfast? dinner;
  Breakfast? snacks;

  DietDetails({this.breakfast, this.lunch, this.dinner, this.snacks});

  DietDetails.fromJson(Map<String, dynamic> json) {
    breakfast = json['breakfast'] != null
        ? new Breakfast.fromJson(json['breakfast'] as Map<String, dynamic>)
        : null;
    lunch = json['lunch'] != null
        ? new Breakfast.fromJson(json['lunch'] as Map<String, dynamic>)
        : null;
    dinner = json['dinner'] != null
        ? new Breakfast.fromJson(json['dinner'] as Map<String, dynamic>)
        : null;
    snacks = json['snacks'] != null
        ? new Breakfast.fromJson(json['snacks'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breakfast != null) {
      data['breakfast'] = this.breakfast!.toJson();
    }
    if (this.lunch != null) {
      data['lunch'] = this.lunch!.toJson();
    }
    if (this.dinner != null) {
      data['dinner'] = this.dinner!.toJson();
    }
    if (this.snacks != null) {
      data['snacks'] = this.snacks!.toJson();
    }
    return data;
  }

  Map<String, Map<String, int>> toMap() {
    final Map<String, Map<String, int>> data =
        new Map<String, Map<String, int>>();
    if (this.breakfast != null) {
      data['breakfast'] = this.breakfast!.toMap();
    }
    if (this.lunch != null) {
      data['lunch'] = this.lunch!.toMap();
    }
    if (this.dinner != null) {
      data['dinner'] = this.dinner!.toMap();
    }
    if (this.snacks != null) {
      data['snacks'] = this.snacks!.toMap();
    }
    return data;
  }
}

class Breakfast {
  int? carbs;
  int? protein;
  int? fruits;
  int? dariy;
  int? fat;
  int? vegies;

  Breakfast(
      {this.carbs,
      this.protein,
      this.fruits,
      this.dariy,
      this.fat,
      this.vegies});

  Breakfast.fromJson(Map<String, dynamic> json) {
    carbs = json['carbs'] as int;
    protein = json['protein'] as int;
    fruits = json['fruits'] as int;
    dariy = json['dariy'] as int;
    fat = json['fat'] as int;
    vegies = json['vegies'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carbs'] = this.carbs;
    data['protein'] = this.protein;
    data['fruits'] = this.fruits;
    data['dariy'] = this.dariy;
    data['fat'] = this.fat;
    data['vegies'] = this.vegies;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['carbs'] = this.carbs as int;
    data['protein'] = this.protein as int;
    data['fruits'] = this.fruits as int;
    data['dariy'] = this.dariy as int;
    data['fat'] = this.fat as int;
    data['vegies'] = this.vegies as int;
    return data;
  }
}

class Item {
  final String displayName;
  final String assetPath;
  Item(this.displayName, this.assetPath);
}
