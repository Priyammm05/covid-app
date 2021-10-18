import 'package:covid_app/homepage.dart';
import 'package:covid_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-app',
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: primaryBlack,
        canvasColor: const Color(0xfff5f5f5),
      ),
      home: const HomePage(),
    );
  }
}
