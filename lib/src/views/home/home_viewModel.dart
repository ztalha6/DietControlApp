import 'package:ads_mediation_setup/google_ads/rewarded_ads.dart';
import 'package:calories_counter/ad_unit_ids/ad_unit_id.dart';
import 'package:calories_counter/src/app.dart';
import 'package:calories_counter/src/global/repos/user_repository.dart';
import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:calories_counter/src/global/services/snackbar_service/snackbar_manager.dart';
import 'package:calories_counter/src/global/setup/startup.dart';
import 'package:calories_counter/src/model/diet_model.dart';
import 'package:calories_counter/src/model/response_model.dart';
import 'package:calories_counter/src/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  SnackbarService snackbarService = locator<SnackbarService>();

  List<Item> vegies = [
    Item("all vegies", 'assets/images/allvegies.png'),
    Item("corns", 'assets/images/corn.png'),
    Item("olives", 'assets/images/olives.png'),
  ];
  List<Item> nuts = [
    Item("almond chashew", 'assets/images/almond.png'),
    Item("fatty seeds", 'assets/images/fattyseeds.png'),
  ];
  List<Item> diary = [
    Item("low fat milk", 'assets/images/milk.png'),
    Item("low fat cheese ", 'assets/images/cheese.png'),
    Item("low fat yougurt", 'assets/images/yougurt.png'),
    Item("nut milk", 'assets/images/milk.png'),
  ];
  List<Item> protien = [
    Item("chicken/meat", 'assets/images/meat.png'),
    Item("eggs", 'assets/images/egg.png'),
    Item("lantils/beans", 'assets/images/beans.png'),
    Item("fish", 'assets/images/fish.png'),
    Item("besan", 'assets/images/besan.png'),
  ];
  List<Item> carbs = [
    Item("chapati", 'assets/images/chapati.png'),
    Item("rice", 'assets/images/rice.png'),
    Item("bread/oats", 'assets/images/bread.png'),
    Item("pasta/noodles", 'assets/images/pasta.png'),
    Item("patato", 'assets/images/patato.png'),
  ];
  List<Item> friuts = [
    Item("any fruit", 'assets/images/anyfruit.png'),
    Item("melon", 'assets/images/melon.png'),
    Item("orange", 'assets/images/orange.png'),
    Item("friut juice", 'assets/images/juice.png'),
    Item("friut chat", 'assets/images/mix.png'),
  ];

  bool _toggleDelete = false;
  bool get toggleDelete => _toggleDelete;
  set toggleDelete(bool val) {
    _toggleDelete = val;
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int val) {
    _currentIndex = val;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime val) {
    _selectedDate = val;
    notifyListeners();
  }

  String _date = DateFormat.yMd().format(DateTime.now());
  String get date => _date;
  set date(String val) {
    _date = val;
    notifyListeners();
  }

  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(PageController val) {
    _pageController = val;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context)
                  .primaryColor
                  .withOpacity(0.2), // header background color
              onPrimary: Colors.black87, // header text color
              onSurface: Colors.grey, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black87, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      selectedDate = picked;
      date = DateFormat.yMd().format(selectedDate);
    }
  }

  Map<String, Map<String, Map<String, int>>> _dietData = {};
  Map<String, Map<String, Map<String, int>>> get dietData => _dietData;
  set dietData(Map<String, Map<String, Map<String, int>>> val) {
    _dietData = val;
    notifyListeners();
  }

  Map<String, Map<String, int>> _finalDietData = {};
  Map<String, Map<String, int>> get finalDietData => _finalDietData;
  set finalDietData(Map<String, Map<String, int>> val) {
    _finalDietData = val;
    notifyListeners();
  }

  String? _userName = '';
  String? get userName => _userName;
  set userName(String? val) {
    _userName = val;
    notifyListeners();
  }

  Future<void> init() async {
    dietData = DataService().getInitialData();
    finalDietData = UserRepository().countedDataModel;
    final String? email = await UserRepository().getUserEmail();
    if (email != null) {
      final UserDetails details = await DataService().getUserDetails(email);
      userName = details.name;
    }
  }

  void incrementItem(int tabNumber, int catagoryIndex, int itemNumber) {
    final int f = 1 +
        dietData[getTabNameFromIndexs(tabNumber)]![
                getCatagoryNameFromIndexs(tabNumber, catagoryIndex)]![
            getItemNameFromIndexs(tabNumber, catagoryIndex, itemNumber)]!;

    dietData[getTabNameFromIndexs(tabNumber)]![
            getCatagoryNameFromIndexs(tabNumber, catagoryIndex)]![
        getItemNameFromIndexs(tabNumber, catagoryIndex, itemNumber)] = f;
    notifyListeners();
  }

  void decrementItem(int tabNumber, int catagoryIndex, int itemNumber) {
    final int f = dietData[getTabNameFromIndexs(tabNumber)]![
                getCatagoryNameFromIndexs(tabNumber, catagoryIndex)]![
            getItemNameFromIndexs(tabNumber, catagoryIndex, itemNumber)]! -
        1;

    if (f >= 0) {
      dietData[getTabNameFromIndexs(tabNumber)]![
              getCatagoryNameFromIndexs(tabNumber, catagoryIndex)]![
          getItemNameFromIndexs(tabNumber, catagoryIndex, itemNumber)] = f;
    }
    notifyListeners();
  }

  String getTabNameFromIndexs(
    int tabNumber,
  ) {
    return dietData.keys.elementAt(tabNumber);
  }

  String getItemNameFromIndexs(
    int tabNumber,
    int catagoryIndex,
    int itemNumber,
  ) {
    return dietData.values
        .elementAt(tabNumber)
        .values
        .elementAt(catagoryIndex)
        .keys
        .elementAt(itemNumber);
  }

  String getCatagoryNameFromIndexs(
    int tabNumber,
    int catagoryIndex,
  ) {
    return dietData.values.elementAt(tabNumber).keys.elementAt(catagoryIndex);
  }

  int getItemsLengthFromIndexs(
    int tabNumber,
    int catagoryIndex,
  ) {
    return dietData.values
        .elementAt(tabNumber)
        .values
        .elementAt(catagoryIndex)
        .keys
        .length;
  }

  int getItemValueFromIndexs(
    int tabNumber,
    int catagoryIndex,
    int itemNumber,
  ) {
    return dietData.values
        .elementAt(tabNumber)
        .values
        .elementAt(catagoryIndex)
        .values
        .elementAt(itemNumber);
  }

  RewardedAdsProvider rewardedAd =
      RewardedAdsProvider(rewardedAdId: AdUnitId.rewarded);

  loadRewardedAd() {
    rewardedAd.show();
  }

  Future<void> saveData(BuildContext context) async {
    loadRewardedAd();
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 6; j++) {
        finalDietData[getTabNameFromIndexs(i)]![
                getCatagoryNameFromIndexs(i, j)] =
            DataService()
                .getTotalCountsofMealType(dietData, getTabNameFromIndexs(i), j);
      }
    }
    final ResponseModel res =
        await DataService().saveUserData(date, finalDietData);
    if (res.sucess) {
      dietData = DataService().getInitialData();
      rootScaffoldMessengerKey.currentState?.showSnackBar(
        SnackbarManager().getSuccessSnackbar(
          'Saved!',
          16,
          const Duration(
            milliseconds: 2500,
          ),
        ),
      );
    } else {
      rootScaffoldMessengerKey.currentState?.showSnackBar(
        SnackbarManager().showError(
          content: res.error,
        ),
      );
    }
  }
}
