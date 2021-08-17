import 'package:deli_meal/models/category.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArgs =
        ModalRoute.of(context)!.settings.arguments! as Map<String, Object>;
    final Category category = routeArgs['category']! as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text(
          category.id,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
