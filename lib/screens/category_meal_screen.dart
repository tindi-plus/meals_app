import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  final String id;
  final String categoryTitle;

  const CategoryMealScreen({
    super.key,
    required this.id,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
