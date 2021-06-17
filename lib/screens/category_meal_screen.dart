import "package:flutter/material.dart";

import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static final String routeName = "/category-meals";
  // final String categoryId;
  // final String categorTitle;

  // CategoryMealScreen(this.categoryId, this.categorTitle);
  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categorTitle = routeArgs["title"] as String;
    final categorId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categorId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (_, index) {
            final meal = categoryMeals[index];
            return MealItem(
                key: ValueKey(meal.id),
                title: meal.title,
                imageUrl: meal.imageUrl,
                duration: meal.duration,
                complexity: meal.complexity,
                affordability: meal.affordability);
          }),
    );
  }
}
