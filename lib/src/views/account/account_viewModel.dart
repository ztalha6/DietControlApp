import 'dart:convert';
import 'dart:io';

import 'package:calories_counter/src/global/repos/user_repository.dart';
import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:calories_counter/src/views/sign_in/sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

class AccountViewModel extends BaseViewModel {
  Future<void> backUptoDrive() async {
    final String configDataFilePath = await writeToFile();
    Share.shareFiles([configDataFilePath]);
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    navigateToSignInView(context);
  }

  void navigateToSignInView(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const SignInView()),
    );
  }

  List<Map<String, Map<String, int>>> _data = [];
  List<Map<String, Map<String, int>>> get data => _data;
  set data(List<Map<String, Map<String, int>>> val) {
    _data = val;
    notifyListeners();
  }

  Future<void> getData() async {
    final String? email = await UserRepository().getUserEmail();
    if (email != null) {
      dates = await DataService().getDates(email);
      data = await DataService().getHistory(dates);
    }
  }

  List<String> _dates = [];
  List<String> get dates => _dates;
  set dates(List<String> val) {
    _dates = val;
    notifyListeners();
  }

  Future<String> writeToFile() async {
    final directory = await getTemporaryDirectory();
    final File file = await _getFileFromPath(directory.path);
    for (var i = 0; i < dates.length; i++) {
      await file.writeAsString("${dates[i]}\n${json.encode(data[i])}");
    }

    return file.path;
  }

  Future<File> _getFileFromPath(String path) async {
    if (path.contains('backup.txt')) {
      return File(path);
    }
    return File('$path/backup.txt');
  }
}
