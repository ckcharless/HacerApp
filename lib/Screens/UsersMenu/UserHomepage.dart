import 'package:flutter/material.dart';
import 'package:hacer/Screens/UsersMenu/HOME/UserHome.dart';
import 'package:hacer/Screens/UsersMenu/UserNotif.dart';
import 'package:hacer/Screens/UsersMenu/UserProfil.dart';
import 'package:hacer/Screens/UsersMenu/UserSparing.dart';

class UserHomeScreen extends StatefulWidget {
  UserHomeScreen({Key key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomeScreen> {


PageController _pageController = PageController();
List<Widget> _screen = [
 UserHome(), UserNotif(), UserSparing(),UserProfil()
];

void _onPageChanged(int index){
  setState(() {
    _selectedIndex = index;
  });
}


  void _onItemTapped(int selectedIndex) {
  _pageController.jumpToPage(selectedIndex);
  }

  int _selectedIndex = 0;

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
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
            title: Text('Home',
            style: TextStyle(color: _selectedIndex == 0 ? Colors.blue : Colors.grey),),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_rounded,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              ),
              title: Text('Notification',
              style: TextStyle(color: _selectedIndex == 1 ? Colors.blue : Colors.grey),),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom_sharp,
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              title: Text('Sparing',
              style: TextStyle(color: _selectedIndex == 2 ? Colors.blue : Colors.grey),),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded,
              color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
              ),
              title: Text('Profile',
              style: TextStyle(color: _selectedIndex == 3 ? Colors.blue : Colors.grey),),
          ),
        ],

      ),
    );
  }
}