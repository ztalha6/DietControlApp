import 'package:calories_counter/src/global/services/data_service/data_service.dart';
import 'package:calories_counter/src/views/bottom_navbar/bottomBar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInViewModel extends BaseViewModel {
  bool _googleSignIn = false;
  bool get googleSignIn => _googleSignIn;
  set googleSignIn(bool val) {
    _googleSignIn = val;
    notifyListeners();
  }

  bool _facebookSignIn = false;
  bool get facebookSignIn => _facebookSignIn;
  set facebookSignIn(bool val) {
    _facebookSignIn = val;
    notifyListeners();
  }

  bool _appaleSignIn = false;
  bool get appaleSignIn => _appaleSignIn;
  set appaleSignIn(bool val) {
    _appaleSignIn = val;
    notifyListeners();
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    googleSignIn = true;
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      await DataService().saveUserLoginDetails(
        googleSignInAccount.displayName,
        googleSignInAccount.email,
      );
      navigate(context);
    } else {
      googleSignIn = false;
    }
  }

  void navigate(BuildContext context) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => const BottomNavBarView()),
    );
  }

  Future<void> loginWithFacebook() async {
    facebookSignIn = true;
    FacebookAuth facebookLogin = FacebookAuth.instance;
    final LoginResult result =
        await facebookLogin.login(permissions: ['email']);
    if (result.status == LoginStatus.success) {
      final String token = result.accessToken!.token;
      final Map<String, dynamic> userData = await facebookLogin.getUserData();
      final String email = userData['email'].toString();
      final String id = userData['id'].toString();
    }
    facebookSignIn = false;
  }
}
