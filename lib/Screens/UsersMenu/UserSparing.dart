import 'package:flutter/material.dart';

class UserSparing extends StatefulWidget {
  UserSparing({Key key}) : super(key: key);

  @override
  _UserSparingState createState() => _UserSparingState();
}

class _UserSparingState extends State<UserSparing> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('User Sparing'),
        )
    );
  }
}