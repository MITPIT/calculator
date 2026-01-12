import 'package:flutter/material.dart';
import 'views/calculator_view.dart';
import 'views/converter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC Calculator',
      // Define the starting screen
      initialRoute: '/',
      // Define the routes table
      routes: {
        '/': (context) => CalculatorView(),
        '/converter': (context) => ConverterView(),
      },
    );
  }
}