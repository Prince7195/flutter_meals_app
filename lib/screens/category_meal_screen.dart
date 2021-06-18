import "package:flutter/material.dart";

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static final String routeName = "/category-meals";
  final List<Meal> meals;
  CategoryMealScreen(this.meals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categorTitle;
  late List<Meal> displayedMeal;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      var routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categorTitle = routeArgs["title"] as String;
      final categorId = routeArgs["id"];
      displayedMeal = widget.meals
          .where((meal) => meal.categories.contains(categorId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categorTitle),
      ),
      body: ListView.builder(
          itemCount: displayedMeal.length,
          itemBuilder: (_, index) {
            final meal = displayedMeal[index];
            return MealItem(
              key: ValueKey(meal.id),
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability,
              removeItem: _removeMeal,
            );
          }),
    );
  }
}
