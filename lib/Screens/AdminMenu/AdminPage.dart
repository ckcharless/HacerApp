import 'package:flutter/material.dart';
import 'package:hacer/Screens/AdminMenu/AdminHome/AdminHome.dart';
import 'package:hacer/Screens/AdminMenu/ManageField/ManageField.dart';
import 'package:hacer/Screens/AdminMenu/AdminReport/AdminReport.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPage createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {

  PageController _pageController = PageController();
  List<Widget> _screen = [
    AdminHome(), ManageField(), AdminReport()
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
            icon: Icon(Icons.view_list,
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
            title: Text('Manage Booking',
              style: TextStyle(color: _selectedIndex == 0 ? Colors.blue : Colors.grey),),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.inventory,
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
            ),
            title: Text('Manage Field',
              style: TextStyle(color: _selectedIndex == 1 ? Colors.blue : Colors.grey),),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.print,
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
            ),
            title: Text('Report',
              style: TextStyle(color: _selectedIndex == 2 ? Colors.blue : Colors.grey),),
          ),

        ],

      ),
    );
  }
}