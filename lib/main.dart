import 'package:flutter/material.dart';
import './HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarromBoard Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        primaryColorDark: Colors.blueAccent,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent),
      ),
      home: HomeScreen(),
    );
  }
}
