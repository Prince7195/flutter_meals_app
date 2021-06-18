import "package:flutter/material.dart";

import '../widgets/drawer_main.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';

  Map<String, bool> filters;
  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _glutenFree = widget.filters["gluten"] as bool;
      _vegan = widget.filters["vegan"] as bool;
      _vegetarian = widget.filters["vegetarian"] as bool;
      _lactoseFree = widget.filters["lactose"] as bool;
    });
  }

  void _save() {
    widget.saveFilters({
      "gluten": _glutenFree,
      "lactose": _lactoseFree,
      "vegetarian": _vegetarian,
      "vegan": _vegan,
    });
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool value, Function(bool) updateValue) {
    return SwitchListTile(
      value: value,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: _save,
            icon: Icon(
              Icons.save,
            ),
          )
        ],
      ),
      drawer: DrawerMain(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluten Free",
                  "Only inclueds gluten free meals",
                  _glutenFree,
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose Free",
                  "Only inclueds lactose free meals",
                  _lactoseFree,
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegetarian",
                  "Only inclueds vegetarian meals",
                  _vegetarian,
                  (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only inclueds vegan meals",
                  _vegan,
                  (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
