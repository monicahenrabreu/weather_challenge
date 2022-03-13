import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather_challenge/ui/screens/home/home_page.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16.0),
          bodyText2: TextStyle(fontSize: 18.0),
        ).apply(displayColor: Colors.black),
      ),

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: const HomePage(),
    );
  }
}
