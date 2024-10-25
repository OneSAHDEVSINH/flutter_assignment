import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApp extends StatefulWidget {
  @override
  _NewsAppState createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  List _newsArticles = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  _fetchNews() async {
    final response = await http.get(
        Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY'));
    if (response.statusCode == 200) {
      setState(() {
        _newsArticles = json.decode(response.body)['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Categories'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Business'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Entertainment'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            // Add more categories as needed
          ],
        ),
      ),
      body: _newsArticles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _newsArticles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_newsArticles[index]['title']),
            subtitle: Text(_newsArticles[index]['description']),
          );
        },
      ),
    );
  }
}
