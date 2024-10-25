import 'package:flutter/material.dart';
import 'bmi_calculator.dart';
import 'expense_app.dart';
import 'calculator_app.dart';
import 'news_app.dart';
import 'meals_app.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildHomeScreenButton(context, 'BMI Calculator', BMICalculator()),
          _buildHomeScreenButton(context, 'Expense App', ExpenseApp()),
          _buildHomeScreenButton(context, 'Calculator App', CalculatorApp()),
          _buildHomeScreenButton(context, 'News App', NewsApp()),
          _buildHomeScreenButton(context, 'Meals App', MealsApp()),
        ],
      ),
    );
  }

  Widget _buildHomeScreenButton(BuildContext context, String title, Widget widget) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
