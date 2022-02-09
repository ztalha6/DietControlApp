import 'dart:convert';
import 'dart:io';

import 'package:calories_counter/src/views/sign_in/sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';

class AccountViewModel extends BaseViewModel {
  Future<void> backUptoDrive() async {
    // final String configDataFilePath = await writeToFile();
    // Share.shareFiles([configDataFilePath]);
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

  Future<String> writeToFile(
    Map<String, Map<String, Map<String, int>>> data,
  ) async {
    final directory = await getTemporaryDirectory();
    final File file = await _getFileFromPath(directory.path);
    await file.writeAsString(json.encode(data));
    return file.path;
  }

  Future<File> _getFileFromPath(String path) async {
    if (path.contains('backup.txt')) {
      return File(path);
    }
    return File('$path/backup.txt');
  }
}
