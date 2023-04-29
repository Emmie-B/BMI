import 'package:bmi/screens/home.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.green,
        colorScheme: const ColorScheme.light(primary: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
        ), //       FloatingActionButtonThemeData(backgroundColor: Colors.amber),
      ),
      // home: const MyHomePage(title: 'BMI CALCULATOR'),
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(title: 'BMI CALCULATOR'),
        "/result": (context) => ResultScreen(),
      },
    );
  }
}
