import 'package:flutter/material.dart';

import 'screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.orangeAccent,
        canvasColor: Colors.grey.shade50,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: CategoriesScreen.routeName,
      routes: <String, Widget Function(BuildContext)>{
        CategoriesScreen.routeName: (BuildContext ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (BuildContext ctx) =>
            CategoryMealsScreen(),
      },
    );
  }
}
