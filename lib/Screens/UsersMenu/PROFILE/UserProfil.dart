import 'package:flutter/material.dart';

import 'commponents/body.dart';



class UserProfil extends StatelessWidget {
static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
        Text("Profile"),
        ),
        backgroundColor: Colors.white60,
        automaticallyImplyLeading: false,
      ),

      body: Body(),

    );
  }

}