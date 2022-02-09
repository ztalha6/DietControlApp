import 'dart:convert';

import 'package:calories_counter/src/global/repos/user_repository.dart';
import 'package:calories_counter/src/model/diet_model.dart';
import 'package:calories_counter/src/model/response_model.dart';
import 'package:calories_counter/src/model/user_model.dart';
import 'package:flutter/material.dart';

class DataService {
  late final UserRepository _userRepository = UserRepository();

  final List<Color> catagoryColors = const [
    Color(0xFF84A94F),
    Color(0xFFBFBBB6),
    Color(0xFFF3B65A),
    Color(0xFF55C2F1),
    Color(0xFFED8B88),
    Color(0xFFB7DB71),
  ];

  Map<String, Map<String, Map<String, int>>> getInitialData() {
    return _userRepository.mealdata;
  }

  Future<ResponseModel> saveUserData(
    String date,
    Map<String, Map<String, Map<String, int>>> data,
  ) async {
    // final Map<String, Map<String, int>> countedData =
    //     UserRepository().countedDataModel;
    // for (var i = 0; i < countedData.keys.length; i++) {
    //   final Map<String, int> c = countedData.values.elementAt(i);
    //   for (var j = 0; j < c.keys.length; j++) {
    //     countedData[countedData.keys.elementAt(i)]![countedData.values
    //         .elementAt(i)
    //         .keys
    //         .elementAt(j)] = getTotalCountsofCatagory(data, j);
    //   }
    // }
    final String jsonConvetedData = json.encode(data);
    final String? email = await _userRepository.getUserEmail();
    return _userRepository.savaUserDataInStorage(email, date, jsonConvetedData);
  }

  Future<ResponseModel> saveUserDetails(
    String email,
    UserDetails data,
  ) async {
    final bool saved = await _userRepository.saveUserDetails(data, email);
    return ResponseModel(sucess: saved, error: '');
  }

  Future<UserDetails> getUserDetails(
    String email,
  ) async {
    final String data = await _userRepository.getUserDetails(email);
    return UserDetails.fromJson(json.decode(data) as Map<String, dynamic>);
  }

  Future<void> saveUserLoginDetails(String? name, String email) async {
    await _userRepository.saveUserDetails(
      UserDetails(
        name: name,
      ),
      email,
    );
    await _userRepository.savesEmail(email);
  }

  Future<List<String>> getDates(String email) async {
    final List<String> dates =
        await _userRepository.getDatesAgainstEmail(email) ?? [];
    return dates;
  }

  Future<List<Map<String, Map<String, Map<String, int>>>>> getHistory(
    List<String> dates,
  ) async {
    final List<Map<String, Map<String, Map<String, int>>>> data = [];
    if (dates.isNotEmpty) {
      for (final date in dates) {
        final String? temp = await _userRepository.getDataAgainstDate(date);
        // dynamic c = json.decode(temp!);
        final parsed = jsonDecode(temp!) as Map<String, dynamic>;
        DietDetails i = DietDetails.fromJson(parsed);
        // final parsed2 =
        //     parsed[parsed.keys.elementAt(0)] as Map<String, dynamic>;
        // final parsed3 =
        //     parsed2[parsed2.keys.elementAt(0)] as Map<String, dynamic>;
        // final parsed4 = parsed3[parsed3.keys.elementAt(0)];
        print(parsed);
        // Map<String, Map<String, Map<String, int>>> f = {};
        // final Map<String, Map<String, int>> countedData =
        //     UserRepository().countedDataModel;
        // for (var i = 0; i < UserRepository().mealdata.keys.length; i++) {
        //   final Map<String, Map<String, int>> c = UserRepository().mealdata.values.elementAt(i);
        //   for (var j = 0; j < c.keys.length; j++) {
        //     f[][]=
        //   }
        // }
        data.add(i.toMap());
      }
    }
    return data;
  }

  int getTotalCountsofCatagory(
    Map<String, Map<String, Map<String, int>>> data,
    int catagoryIndex,
  ) {
    // final Map<String, Map<String, Map<String, int>>> temp =
    //     UserRepository().mealdata;
    Map<String, Map<String, int>> catagory = {};
    Map<String, int> item = {};
    int values = 0;
    for (var i = 0; i < data.keys.length; i++) {
      catagory = data[data.keys.elementAt(i)]!;
      item = catagory[catagory.keys.elementAt(catagoryIndex)]!;
      values += item.values.reduce((sum, element) => sum + element);
    }
    return values;
  }
}
