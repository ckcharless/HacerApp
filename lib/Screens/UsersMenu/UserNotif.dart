import 'package:flutter/material.dart';

class UserNotif extends StatefulWidget {
  UserNotif({Key key}) : super(key: key);

  @override
  _UserNotifState createState() => _UserNotifState();
}

class _UserNotifState extends State<UserNotif> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('User Notif'),
        )
    );
  }
}