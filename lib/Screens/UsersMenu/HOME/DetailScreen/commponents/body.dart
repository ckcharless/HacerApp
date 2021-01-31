import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 380,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[

                    Image.asset(
                      "assets/images/lapangan1.jpg",
                      fit: BoxFit.cover,
                      height: 250,
                      width: 1000,
                    ),
                  ],
                ),
              ),
              Text("CHAMPION FUTSAL",
                style: Theme.of(context).textTheme.headline6,
              ),
              Text('HARGA : Rp 50.000 / jam'),
              Text('WAKTU BUKA : 08:00 AM - 10:00 PM'),
              Text('FASILITAS : WC | TEMPAT SHOLAT'),
              FlatButton(onPressed: _launchMap, child: Text('LOCATION'),color: Colors.lightBlue,),

            ],
          ),
        ),

        Container(
          margin: EdgeInsets.all(kDefaultPadding),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              Text('BOOKING',style: TextStyle(color: Colors.white),)
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.all(kDefaultPadding),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: <Widget>[
              Text('BOOKING',style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ],
    );
  }
}
_launchMap() async{

}

