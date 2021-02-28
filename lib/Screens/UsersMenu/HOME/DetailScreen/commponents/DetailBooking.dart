
import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailLapangan.dart';

import 'bodyBooking/body.dart';


class DetailBooking extends StatelessWidget {
  final Product product;

  const DetailBooking({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(),
    );
  }


  AppBar buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,

      ),

    );

  }
}
