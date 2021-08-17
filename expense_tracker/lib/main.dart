import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        accentColor: Colors.deepPurple,
        primarySwatch: Colors.teal,
        fontFamily: "FiraCode",
        textTheme: TextTheme(
          headline1: ThemeData.light().textTheme.headline1.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: "FiraCode",
                fontSize: 28,
              ),
          bodyText1: ThemeData.light().textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: "FiraCode",
              ),
        ),
        iconTheme: IconThemeData().copyWith(
          color: Colors.white,
        ),
      ),
      home: HomePage('Expense Tracker'),
    );
  }
}
