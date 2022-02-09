import 'package:calories_counter/src/app.dart';
import 'package:calories_counter/src/global/repos/user_repository.dart';
import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:calories_counter/src/global/services/snackbar_service/snackbar_manager.dart';
import 'package:calories_counter/src/model/response_model.dart';
import 'package:calories_counter/src/model/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  set emailController(TextEditingController val) {
    _emailController = val;
    notifyListeners();
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  set nameController(TextEditingController val) {
    _nameController = val;
    notifyListeners();
  }

  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  set phoneController(TextEditingController val) {
    _phoneController = val;
    notifyListeners();
  }

  int _height = 5;
  int get height => _height;
  set height(int val) {
    _height = val;
    notifyListeners();
  }

  int _weight = 5;
  int get weight => _weight;
  set weight(int val) {
    _weight = val;
    notifyListeners();
  }

  int _radioValue = 0;
  int get radioValue => _radioValue;
  set radioValue(int val) {
    _radioValue = val;
    notifyListeners();
  }

  Future<void> init() async {
    final String? email = await UserRepository().getUserEmail();
    if (email != null) {
      emailController.text = email;
      final UserDetails data = await DataService().getUserDetails(email);
      if (data.name != null) {
        nameController.text = data.name!;
      }
      phoneController.text = data.phone ?? '';
      radioValue = data.gender ?? 0;
      height = data.height ?? 5;
      weight = data.weight ?? 5;
    }
  }

  void incrementHeight({bool increment = false}) {
    if (increment) {
      height++;
    } else {
      height--;
    }
  }

  void incrementWeight({bool increment = false}) {
    if (increment) {
      weight++;
    } else {
      weight--;
    }
  }

  Future<void> save() async {
    final ResponseModel res = await DataService().saveUserDetails(
      emailController.text,
      UserDetails(
        name: nameController.text,
        phone: phoneController.text,
        height: height,
        weight: weight,
        gender: radioValue,
      ),
    );
    if (res.sucess) {
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
