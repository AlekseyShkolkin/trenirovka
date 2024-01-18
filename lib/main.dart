import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tren/laod.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru', 'RU'),
      ],
      theme: ThemeData(
        primaryColor: Color.fromRGBO(254, 207, 5, 1),
        accentColor: Color.fromRGBO(254, 168, 5, 1),
        indicatorColor: Color.fromRGBO(103, 76, 215, 1),
        // accentColor: Color.fromRGBO(54, 24, 175, 1),
        // accentColor: Color.fromRGBO(54, 24, 175, 1),
      ),
      home: Load(),
    );
  }
}
