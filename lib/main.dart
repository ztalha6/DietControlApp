import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:calories_counter/src/global/constants/routes.dart';
import 'package:calories_counter/src/global/setup/startup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  // Initialize the SDK before making an ad request.
  // You can check each adapter's initialization status in the callback.
  MobileAds.instance.initialize().then((initializationStatus) {
    initializationStatus.adapterStatuses.forEach((key, value) {
      debugPrint('Adapter status for $key: ${value.description}');
    });
  });
  
  await Firebase.initializeApp();
  setupLocator();
  runApp(
    MyApp(
      route: splash,
    ),
  );
}
