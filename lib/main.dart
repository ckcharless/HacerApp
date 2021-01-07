import 'package:flutter/material.dart';
import 'package:hacer/Screens/WelcomeScreen/LoginScreen.dart';
import 'package:hacer/routing_constant.dart';
import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Screen',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        scaffoldBackgroundColor: Colors.lightBlueAccent
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: LoginView,
    );
  }
}
