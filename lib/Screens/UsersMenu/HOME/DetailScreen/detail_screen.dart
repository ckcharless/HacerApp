
import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailLapangan.dart';
import "commponents/DetailBooking.dart";

import 'commponents/body.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: buildAppBar(context),
      body: Body(product: product,),

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
