import "package:flutter/material.dart";

class CategoryMealScreen extends StatelessWidget {
  // final String categoryId;
  // final String categorTitle;

  // CategoryMealScreen(this.categoryId, this.categorTitle);
  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categorTitle = routeArgs["title"] as String;
    final categorId = routeArgs["id"];
    return Scaffold(
      appBar: AppBar(
        title: Text(categorTitle),
      ),
      body: Center(
        child: Text('Selected Recipe meals list'),
      ),
    );
  }
}
