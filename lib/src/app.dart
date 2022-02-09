import 'package:calories_counter/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'settings/settings_controller.dart';
import 'package:calories_counter/src/global/constants/router.dart' as router;

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.route,
  }) : super(key: key);
  final String route;

  final SettingsController sc = SettingsController(SettingsService());

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsController>.reactive(
      viewModelBuilder: () => SettingsController(SettingsService()),
      onModelReady: (m) => m.init(),
      builder: (context, model, _) => AnimatedBuilder(
        builder: (context, _) {
          return MaterialApp(
            scaffoldMessengerKey: rootScaffoldMessengerKey,
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(
              dividerColor: Colors.white,
              appBarTheme: const AppBarTheme(
                color: Colors.white,
                shadowColor: Colors.transparent,
                iconTheme: IconThemeData(color: Color(0xFFFE724C)),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
              brightness: Brightness.light,
              primaryColor: const Color(0xFFFE724C),
              fontFamily: 'Urbanist',
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFFE724C),
                ),
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  // ignore: use_full_hex_values_for_flutter_colors
                  primary: const Color(0xFFFE724C1A),
                  side: const BorderSide(
                    color: Color(0xFFFE724C),
                  ),
                ),
              ),
              buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 60,
                minWidth: double.infinity,
                textTheme: ButtonTextTheme.primary,
                buttonColor: Theme.of(context).primaryColor,
              ),
              textTheme: const TextTheme(
                headline6: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 32,
                ),
                headline1: TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  fontSize: 20,
                ),
                headline5: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                caption: TextStyle(
                  fontSize: 16,
                ),
              ),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // darkTheme: ThemeData.dark(),
            themeMode: model.themeMode,
            initialRoute: route,
            onGenerateRoute: router.generateRoute,
          );
        },
        animation: sc,
      ),
    );
  }
}
