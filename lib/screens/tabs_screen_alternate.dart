import "package:flutter/material.dart";

// import './favorites_screen.dart';
import 'category_screen.dart';

class TabsScreenAlternate extends StatefulWidget {
  @override
  _TabsScreenAlternateState createState() => _TabsScreenAlternateState();
}

class _TabsScreenAlternateState extends State<TabsScreenAlternate> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Categories",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "Favorites",
                icon: Icon(Icons.star),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryScreen(),
            // FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
