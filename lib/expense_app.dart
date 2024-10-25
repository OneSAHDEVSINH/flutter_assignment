import 'package:flutter/material.dart';

class ExpenseApp extends StatefulWidget {
  @override
  _ExpenseAppState createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  List<Map<String, String>> _expenses = [
    {'title': 'Grocery', 'amount': '20'},
    {'title': 'Entertainment', 'amount': '50'},
  ];

  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  void _addExpense() {
    setState(() {
      _expenses.add({
        'title': _titleController.text,
        'amount': _amountController.text,
      });
      _titleController.clear();
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextField(
                          controller: _amountController,
                          decoration: InputDecoration(labelText: 'Amount'),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            _addExpense();
                            Navigator.of(ctx).pop();
                          },
                          child: Text('Add Expense'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(_expenses[index]['title'] ?? 'No Title'),
            subtitle: Text('\$${_expenses[index]['amount']}'),
          );
        },
      ),
    );
  }
}
