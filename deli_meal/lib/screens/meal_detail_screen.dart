import 'package:deli_meal/models/meal.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments! as String;
    final Meal selectedMeal =
        dummyMeals.firstWhere((Meal meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: 'meal_$mealId',
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <ListCard>[
                  ListCard(
                    title: 'Ingredients',
                    titleLeading: Icons.fastfood,
                    list: selectedMeal.ingredients,
                    listLeading: Icons.chevron_right,
                  ),
                  ListCard(
                    title: 'Steps',
                    titleLeading: Icons.menu_book,
                    list: selectedMeal.steps,
                    listLeading: Icons.chevron_right,
                    margin: const EdgeInsets.only(top: 8.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.title,
    required this.list,
    this.margin = EdgeInsets.zero,
    this.listLeading,
    this.titleLeading,
  }) : super(key: key);

  final String title;
  final List<String> list;
  final EdgeInsetsGeometry? margin;
  final IconData? listLeading;
  final IconData? titleLeading;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            leading: titleLeading != null
                ? Icon(
                    titleLeading,
                    color: Theme.of(context).primaryColorLight,
                  )
                : null,
          ),
          const Divider(
            height: 0,
          ),
          ListView.separated(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => ListTile(
              title: Text(list[index]),
              leading: listLeading != null
                  ? Icon(
                      listLeading,
                      color: Theme.of(context).accentColor,
                    )
                  : null,
            ),
            separatorBuilder: (_, __) => const Divider(height: 0),
            itemCount: list.length,
          ),
        ],
      ),
    );
  }
}
