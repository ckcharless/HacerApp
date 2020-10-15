import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
                'assets/images/logo.png',
                height: 50
            ),
            SizedBox(width: 20,),
            Text('HACER'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child : Text('Welcome to HACER'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blueGrey
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.),
              title: Text('Notification'),
              backgroundColor: Colors.blueGrey
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom_rounded),
              title: Text('Sparing'),
              backgroundColor: Colors.blueGrey
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_outlined),
              title: Text('Profile'),
              backgroundColor: Colors.blueGrey
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


