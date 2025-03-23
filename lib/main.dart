import 'package:flutter/material.dart';
import 'package:harry_potter_app/src/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CharactersListScreen(),
    );
  }
}
