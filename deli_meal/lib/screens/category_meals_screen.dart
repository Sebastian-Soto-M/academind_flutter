import 'package:deli_meal/models/meal.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments! as Map<String, String>;
    final String? categoryTitle = routeArgs['title'];
    final String? categoryId = routeArgs['id'];
    final List<Meal> categoryMeals = dummyMeals
        .where((Meal meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? 'No Title'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
