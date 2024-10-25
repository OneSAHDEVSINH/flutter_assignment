import 'package:flutter/material.dart';

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  List<Map<String, String>> _meals = [
    {'title': 'Pizza', 'category': 'Non-Veg'},
    {'title': 'Salad', 'category': 'Veg'},
  ];
  List<Map<String, String>> _filteredMeals = [];
  bool _isVeg = false;

  @override
  void initState() {
    super.initState();
    _filteredMeals = _meals;
  }

  void _filterMeals(bool isVeg) {
    setState(() {
      _isVeg = isVeg;
      _filteredMeals = _meals
          .where((meal) => _isVeg ? meal['category'] == 'Veg' : true)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(_isVeg ? Icons.eco : Icons.fastfood),
            onPressed: () => _filterMeals(!_isVeg),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredMeals.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(_filteredMeals[index]['title'] ?? ''),
          );
        },
      ),
    );
  }
}
