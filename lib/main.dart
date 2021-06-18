import 'dart:ui';

import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false,
  };

  List<Meal> _availablemeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _availablemeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }
        if (_filters["vegan"] == true && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(String mealId) {
    final existIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoryScreen(),
      initialRoute: "/", // default route "/"
      routes: {
        "/": (_) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (_) =>
            CategoryMealScreen(_availablemeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toggleFavoriteMeal, _isMealFavorite),
        FiltersScreen.routeName: (_) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
