import 'package:flutter/material.dart';
import 'package:hacer/Screens/WelcomeScreen/LoginScreen.dart';
import 'package:hacer/Screens/AdminMenu/HomePage.dart';
import 'package:hacer/Screens/UsersMenu/UserHomepage.dart';
import 'package:hacer/Screens/WelcomeScreen/RegisterScreen.dart';
import 'package:hacer/routing_constant.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name){
    case LoginView :
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case UserHomeView :
      return MaterialPageRoute(builder: (context) => UserHomeScreen());
    case RegisterScreenView :
      return MaterialPageRoute(builder: (context) => RegisterScreen());
    case AdminHomeView :
      return MaterialPageRoute(builder: (context) => HomeScreen());
    default :
      return MaterialPageRoute(builder: (context) => LoginScreen());
  }
}