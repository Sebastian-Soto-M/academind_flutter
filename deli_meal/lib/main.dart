import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
        canvasColor: Colors.indigo.shade50,
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
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.indigo.shade700,
        primaryColorDark: Colors.indigo.shade900,
        primaryColorLight: Colors.indigo.shade400,
        accentColor: Colors.pink.shade500,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/', // default is '/'
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (BuildContext ctx) =>
            CategoryMealsScreen(),
        MealDetailScreen.routeName: (BuildContext ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<CategoriesScreen>(
          builder: (BuildContext ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
