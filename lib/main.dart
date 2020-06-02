import 'package:flutter/material.dart';
import 'package:flutter_exercise_four/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhoenixFlutterShop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}