import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';
import 'body.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Back'.toUpperCase(),
          style: Theme.of(context).textTheme.bodyText2,
        ),

      ),
    );
  }
}
