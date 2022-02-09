import 'package:calories_counter/src/global/constants/routes.dart';
import 'package:calories_counter/src/global/setup/startup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    MyApp(
      route: splash,
    ),
  );
}
