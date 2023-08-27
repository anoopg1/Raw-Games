import 'package:flutter/material.dart';
import 'package:rawg_gaming_zone/ui/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rawg Gaming Zone',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
    );
  }
}
