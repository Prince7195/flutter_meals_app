import "package:flutter/material.dart";
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }
    return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (_, index) {
          final meal = favoriteMeals[index];
          return MealItem(
            key: ValueKey(meal.id),
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
            removeItem: () {},
          );
        });
  }
}
