class DietDetails {
  Catagory? breakfast;
  Catagory? lunch;
  Catagory? dinner;
  Catagory? snacks;

  DietDetails({this.breakfast, this.lunch, this.dinner, this.snacks});

  DietDetails.fromJson(Map<String, dynamic> json) {
    breakfast = json['breakfast'] != null
        ? new Catagory.fromJson(json['breakfast'] as Map<String, dynamic>)
        : null;
    lunch = json['lunch'] != null
        ? new Catagory.fromJson(json['lunch'] as Map<String, dynamic>)
        : null;
    dinner = json['dinner'] != null
        ? new Catagory.fromJson(json['dinner'] as Map<String, dynamic>)
        : null;
    snacks = json['snacks'] != null
        ? new Catagory.fromJson(json['snacks'] as Map<String, dynamic>)
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

  Map<String, Map<String, Map<String, int>>> toMap() {
    final Map<String, Map<String, Map<String, int>>> data =
        new Map<String, Map<String, Map<String, int>>>();
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

class Catagory {
  Crabs? crabs;
  Protein? protein;
  Fruits? fruits;
  Dariy? dariy;
  Fat? fat;
  Vegies? vegies;

  Catagory(
      {this.crabs,
      this.protein,
      this.fruits,
      this.dariy,
      this.fat,
      this.vegies});

  Catagory.fromJson(Map<String, dynamic> json) {
    crabs = json['crabs'] != null
        ? new Crabs.fromJson(json['crabs'] as Map<String, dynamic>)
        : null;
    protein = json['protein'] != null
        ? new Protein.fromJson(json['protein'] as Map<String, dynamic>)
        : null;
    fruits = json['fruits'] != null
        ? new Fruits.fromJson(json['fruits'] as Map<String, dynamic>)
        : null;
    dariy = json['dariy'] != null
        ? new Dariy.fromJson(json['dariy'] as Map<String, dynamic>)
        : null;
    fat = json['fat'] != null
        ? new Fat.fromJson(json['fat'] as Map<String, dynamic>)
        : null;
    vegies = json['vegies'] != null
        ? new Vegies.fromJson(json['vegies'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.crabs != null) {
      data['crabs'] = this.crabs!.toJson();
    }
    if (this.protein != null) {
      data['protein'] = this.protein!.toJson();
    }
    if (this.fruits != null) {
      data['fruits'] = this.fruits!.toJson();
    }
    if (this.dariy != null) {
      data['dariy'] = this.dariy!.toJson();
    }
    if (this.fat != null) {
      data['fat'] = this.fat!.toJson();
    }
    if (this.vegies != null) {
      data['vegies'] = this.vegies!.toJson();
    }
    return data;
  }

  Map<String, Map<String, int>> toMap() {
    final Map<String, Map<String, int>> data =
        new Map<String, Map<String, int>>();
    if (this.crabs != null) {
      data['crabs'] = this.crabs!.toMap();
    }
    if (this.protein != null) {
      data['protein'] = this.protein!.toMap();
    }
    if (this.fruits != null) {
      data['fruits'] = this.fruits!.toMap();
    }
    if (this.dariy != null) {
      data['dariy'] = this.dariy!.toMap();
    }
    if (this.fat != null) {
      data['fat'] = this.fat!.toMap();
    }
    if (this.vegies != null) {
      data['vegies'] = this.vegies!.toMap();
    }
    return data;
  }
}

class Crabs {
  int? chapati;
  int? rice;
  int? bread;
  int? oats;
  int? noodles;
  int? patato;

  Crabs(
      {this.chapati,
      this.rice,
      this.bread,
      this.oats,
      this.noodles,
      this.patato});

  Crabs.fromJson(Map<String, dynamic> json) {
    chapati = json['Chapati'] as int;
    rice = json['Rice'] as int;
    bread = json['Bread'] as int;
    oats = json['Oats'] as int;
    noodles = json['Noodles'] as int;
    patato = json['Patato'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Chapati'] = this.chapati;
    data['Rice'] = this.rice;
    data['Bread'] = this.bread;
    data['Oats'] = this.oats;
    data['Noodles'] = this.noodles;
    data['Patato'] = this.patato;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['Chapati'] = this.chapati ?? 0;
    data['Rice'] = this.rice ?? 0;
    data['Bread'] = this.bread ?? 0;
    data['Oats'] = this.oats ?? 0;
    data['Noodles'] = this.noodles ?? 0;
    data['Patato'] = this.patato ?? 0;
    return data;
  }
}

class Protein {
  int? chicken;
  int? eggs;
  int? beans;
  int? fish;
  int? tofo;
  int? paye;

  Protein(
      {this.chicken, this.eggs, this.beans, this.fish, this.tofo, this.paye});

  Protein.fromJson(Map<String, dynamic> json) {
    chicken = json['Chicken'] as int;
    eggs = json['Eggs'] as int;
    beans = json['Beans'] as int;
    fish = json['Fish'] as int;
    tofo = json['Tofo'] as int;
    paye = json['Paye'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Chicken'] = this.chicken;
    data['Eggs'] = this.eggs;
    data['Beans'] = this.beans;
    data['Fish'] = this.fish;
    data['Tofo'] = this.tofo;
    data['Paye'] = this.paye;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['Chicken'] = this.chicken ?? 0;
    data['Eggs'] = this.eggs ?? 0;
    data['Beans'] = this.beans ?? 0;
    data['Fish'] = this.fish ?? 0;
    data['Tofo'] = this.tofo ?? 0;
    data['Paye'] = this.paye ?? 0;
    return data;
  }
}

class Fruits {
  int? melon;
  int? anyFruits;
  int? orange;
  int? grapes;
  int? mixFruitChat;
  int? mango;

  Fruits(
      {this.melon,
      this.anyFruits,
      this.orange,
      this.grapes,
      this.mixFruitChat,
      this.mango});

  Fruits.fromJson(Map<String, dynamic> json) {
    melon = json['Melon'] as int;
    anyFruits = json['AnyFruits'] as int;
    orange = json['Orange'] as int;
    grapes = json['Grapes'] as int;
    mixFruitChat = json['MixFruitChat'] as int;
    mango = json['Mango'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Melon'] = this.melon;
    data['AnyFruits'] = this.anyFruits;
    data['Orange'] = this.orange;
    data['Grapes'] = this.grapes;
    data['MixFruitChat'] = this.mixFruitChat;
    data['Mango'] = this.mango;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['Melon'] = this.melon ?? 0;
    data['AnyFruits'] = this.anyFruits ?? 0;
    data['Orange'] = this.orange ?? 0;
    data['Grapes'] = this.grapes ?? 0;
    data['MixFruitChat'] = this.mixFruitChat ?? 0;
    data['Mango'] = this.mango ?? 0;
    return data;
  }
}

class Dariy {
  int? slcimed;
  int? lowFatChees;
  int? lowFatWithOutSugar;
  int? yougat;
  int? nutMilk;
  int? chicken;

  Dariy(
      {this.slcimed,
      this.lowFatChees,
      this.lowFatWithOutSugar,
      this.yougat,
      this.nutMilk,
      this.chicken});

  Dariy.fromJson(Map<String, dynamic> json) {
    slcimed = json['Slcimed'] as int;
    lowFatChees = json['LowFatChees'] as int;
    lowFatWithOutSugar = json['LowFatWithOutSugar'] as int;
    yougat = json['Yougat'] as int;
    nutMilk = json['NutMilk'] as int;
    chicken = json['Chicken'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Slcimed'] = this.slcimed;
    data['LowFatChees'] = this.lowFatChees;
    data['LowFatWithOutSugar'] = this.lowFatWithOutSugar;
    data['Yougat'] = this.yougat;
    data['NutMilk'] = this.nutMilk;
    data['Chicken'] = this.chicken;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['Slcimed'] = this.slcimed ?? 0;
    data['LowFatChees'] = this.lowFatChees ?? 0;
    data['LowFatWithOutSugar'] = this.lowFatWithOutSugar ?? 0;
    data['Yougat'] = this.yougat ?? 0;
    data['NutMilk'] = this.nutMilk ?? 0;
    data['Chicken'] = this.chicken ?? 0;
    return data;
  }
}

class Fat {
  int? almond;
  int? fattySeeds;

  Fat({this.almond, this.fattySeeds});

  Fat.fromJson(Map<String, dynamic> json) {
    almond = json['Almond'] as int;
    fattySeeds = json['FattySeeds'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Almond'] = this.almond;
    data['FattySeeds'] = this.fattySeeds;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['Almond'] = this.almond ?? 0;
    data['FattySeeds'] = this.fattySeeds ?? 0;
    return data;
  }
}

class Vegies {
  int? allVeggies;
  int? corns;
  int? olives;

  Vegies({this.allVeggies, this.corns, this.olives});

  Vegies.fromJson(Map<String, dynamic> json) {
    allVeggies = json['AllVeggies'] as int;
    corns = json['Corns'] as int;
    olives = json['Olives'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AllVeggies'] = this.allVeggies;
    data['Corns'] = this.corns;
    data['Olives'] = this.olives;
    return data;
  }

  Map<String, int> toMap() {
    final Map<String, int> data = new Map<String, int>();
    data['AllVeggies'] = this.allVeggies ?? 0;
    data['Corns'] = this.corns ?? 0;
    data['Olives'] = this.olives ?? 0;
    return data;
  }
}
