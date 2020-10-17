import 'package:flutter/material.dart';
import 'package:hacer/Screens/WelcomeScreen/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Screen',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white
      ),
      home: LoginScreen()
    );
  }
}
