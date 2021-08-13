import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purple,
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
      ),
      home: HomePage('Expense Tracker'),
    );
  }
}
