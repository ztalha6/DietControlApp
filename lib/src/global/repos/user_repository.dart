import 'dart:convert';

import 'package:calories_counter/src/global/services/shared_prefs/shared_preferences_manager.dart';
import 'package:calories_counter/src/model/response_model.dart';
import 'package:calories_counter/src/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String USER_EMAIL_KEY = 'userEmail';

class UserRepository {
  Map<String, Map<String, Map<String, int>>> mealdata = {
    "breakfast": {
      "crabs": {
        "Chapati": 0,
        "Rice": 0,
        "Bread": 0,
        "Oats": 0,
        "Noodles": 0,
        "Patato": 0
      },
      "protein": {
        "Chicken": 0,
        "Eggs": 0,
        "Beans": 0,
        "Fish": 0,
        "Tofo": 0,
        "Paye": 0
      },
      "fruits": {
        "Melon": 0,
        "AnyFruits": 0,
        "Orange": 0,
        "Grapes": 0,
        "MixFruitChat": 0,
        "Mango": 0
      },
      "dariy": {
        "Slcimed": 0,
        "LowFatChees": 0,
        "LowFatWithOutSugar": 0,
        "Yougat": 0,
        "NutMilk": 0,
        "Chicken": 0
      },
      "fat": {"Almond": 0, "FattySeeds": 0},
      "vegies": {"AllVeggies": 0, "Corns": 0, "Olives": 0}
    },
    "lunch": {
      "crabs": {
        "Chapati": 0,
        "Rice": 0,
        "Bread": 0,
        "Oats": 0,
        "Noodles": 0,
        "Patato": 0
      },
      "protein": {
        "Chicken": 0,
        "Eggs": 0,
        "Beans": 0,
        "Fish": 0,
        "Tofo": 0,
        "Paye": 0
      },
      "fruits": {
        "Melon": 0,
        "AnyFruits": 0,
        "Orange": 0,
        "Grapes": 0,
        "MixFruitChat": 0,
        "Mango": 0
      },
      "dariy": {
        "Slcimed": 0,
        "LowFatChees": 0,
        "LowFatWithOutSugar": 0,
        "Yougat": 0,
        "NutMilk": 0,
        "Chicken": 0
      },
      "fat": {"Almond": 0, "FattySeeds": 0},
      "vegies": {"AllVeggies": 0, "Corns": 0, "Olives": 0}
    },
    "dinner": {
      "crabs": {
        "Chapati": 0,
        "Rice": 0,
        "Bread": 0,
        "Oats": 0,
        "Noodles": 0,
        "Patato": 0
      },
      "protein": {
        "Chicken": 0,
        "Eggs": 0,
        "Beans": 0,
        "Fish": 0,
        "Tofo": 0,
        "Paye": 0
      },
      "fruits": {
        "Melon": 0,
        "AnyFruits": 0,
        "Orange": 0,
        "Grapes": 0,
        "MixFruitChat": 0,
        "Mango": 0
      },
      "dariy": {
        "Slcimed": 0,
        "LowFatChees": 0,
        "LowFatWithOutSugar": 0,
        "Yougat": 0,
        "NutMilk": 0,
        "Chicken": 0
      },
      "fat": {"Almond": 0, "FattySeeds": 0},
      "vegies": {"AllVeggies": 0, "Corns": 0, "Olives": 0}
    },
    "snacks": {
      "crabs": {
        "Chapati": 0,
        "Rice": 0,
        "Bread": 0,
        "Oats": 0,
        "Noodles": 0,
        "Patato": 0
      },
      "protein": {
        "Chicken": 0,
        "Eggs": 0,
        "Beans": 0,
        "Fish": 0,
        "Tofo": 0,
        "Paye": 0
      },
      "fruits": {
        "Melon": 0,
        "AnyFruits": 0,
        "Orange": 0,
        "Grapes": 0,
        "MixFruitChat": 0,
        "Mango": 0
      },
      "dariy": {
        "Slcimed": 0,
        "LowFatChees": 0,
        "LowFatWithOutSugar": 0,
        "Yougat": 0,
        "NutMilk": 0,
        "Chicken": 0
      },
      "fat": {"Almond": 0, "FattySeeds": 0},
      "vegies": {"AllVeggies": 0, "Corns": 0, "Olives": 0}
    }
  };
  Map<String, Map<String, int>> countedDataModel = {
    'breakfast': {
      "crabs": 0,
      "protein": 0,
      "fruits": 0,
      "dariy": 0,
      "fat": 0,
      "vegies": 0,
    },
    'lunch': {
      "crabs": 0,
      "protein": 0,
      "fruits": 0,
      "dariy": 0,
      "fat": 0,
      "vegies": 0,
    },
    'dinner': {
      "crabs": 0,
      "protein": 0,
      "fruits": 0,
      "dariy": 0,
      "fat": 0,
      "vegies": 0,
    },
    'snacks': {
      "crabs": 0,
      "protein": 0,
      "fruits": 0,
      "dariy": 0,
      "fat": 0,
      "vegies": 0,
    },
  };

  Future<ResponseModel> savaUserDataInStorage(
    String? email,
    String date,
    String jsonData,
  ) async {
    final ResponseModel res = await savesDateAgainstEmail(email, date);
    if (res.sucess) {
      await savesDataAgainstDate(date, jsonData);
      return ResponseModel(sucess: true, error: '');
    } else {
      return res;
    }
  }

  Future<bool> savesDataAgainstDate(
    String date,
    String jsonData,
  ) async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    return prefs.setString(date, jsonData);
  }

  Future<String?> getUserEmail() async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    return prefs.getString(USER_EMAIL_KEY);
  }

  Future<bool> saveUserDetails(UserDetails data, String email) async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    return prefs.setString(email, jsonEncode(data));
  }

  Future<String> getUserDetails(String email) async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    print(prefs.getString(email));
    return prefs.getString(email) ?? '';
  }

  Future<void> savesEmail(
    String email,
  ) async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    await prefs.setString(USER_EMAIL_KEY, email);
  }

  Future<String?> getDataAgainstDate(
    String date,
  ) async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    return prefs.getString(date);
  }

  Future<ResponseModel> savesDateAgainstEmail(
    String? email,
    String date,
  ) async {
    if (email == null) {
      return ResponseModel(
        sucess: false,
        error: 'Email cannot be empty!',
      );
    }
    if (date.isEmpty) {
      return ResponseModel(
        sucess: false,
        error: 'Please select date!',
      );
    }
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    final List<String> dates = await getDatesAgainstEmail(email) ?? [];
    if (dates.contains(date)) {
      return ResponseModel(
        sucess: false,
        error: 'Date alreadt exist!',
      );
    } else {
      dates.add(date);
      return ResponseModel(
        sucess: await prefs.setStringList('${email}dates', dates),
        error: '',
      );
    }
  }

  Future<List<String>?> getDatesAgainstEmail(String email) async {
    final SharedPreferences prefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    if (prefs.containsKey('${email}dates')) {
      return prefs.getStringList('${email}dates');
    }
    return [];
  }
}
