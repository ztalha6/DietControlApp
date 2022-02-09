import 'package:calories_counter/src/global/constants/routes.dart';
import 'package:calories_counter/src/views/account/account_view.dart';
import 'package:calories_counter/src/views/bottom_navbar/bottomBar_view.dart';
import 'package:calories_counter/src/views/pref_intake/pref_intake_view.dart';
import 'package:calories_counter/src/views/profile/profile_view.dart';
import 'package:calories_counter/src/views/sign_in/sign_in_view.dart';
import 'package:calories_counter/src/views/sign_in/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case signInView:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case accountView:
      return MaterialPageRoute(builder: (context) => const AccountView());
    case bottomBarView:
      return MaterialPageRoute(builder: (context) => const BottomNavBarView());
    case profileView:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case preferIntakeView:
      return MaterialPageRoute(builder: (context) => const PreferIntakeView());
    case splash:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case onboardingView:
      return MaterialPageRoute(builder: (context) => OnBoardingPage());
  }
}
