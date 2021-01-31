import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailLapangan.dart';
import 'body.dart';
import 'package:hacer/Screens/AdminMenu/AdminHome/AdminHome.dart';
import 'package:hacer/Screens/AdminMenu/ManageField/ManageField.dart';
import 'package:hacer/Screens/AdminMenu/AdminReport/AdminReport.dart';

class DetailScreen extends StatefulWidget {
  final int index;
  const DetailScreen({Key key, this.index}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen(this.index);
}

class _DetailScreen extends State<DetailScreen> {
  int index;

  _DetailScreen(this.index);

  PageController _pageController = PageController();

  List<Widget> _screen = [
    BookingDetail(id: 1)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'BOOKING DETAIL'.toUpperCase() + ' $index',
          style: Theme.of(context).textTheme.bodyText2,
        ),

      ),
      body: PageView(
        controller: _pageController,
        children: _screen,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
