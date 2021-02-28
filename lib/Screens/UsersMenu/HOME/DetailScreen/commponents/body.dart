import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacer/Screens/WelcomeScreen/LoginScreen.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailLapangan.dart';

import 'bodyBooking/body.dart';
import 'DetailBooking.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 460,
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
                      product.image,
                      fit: BoxFit.cover,
                      height: 250,
                      width: 1000,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("CHAMPION FUTSAL",
                  style: TextStyle(height: 1.5, fontSize: 24,fontWeight: FontWeight.bold)
              ),
              Text('HARGA : Rp 50.000 / jam',
                  style: TextStyle(height: 1.5, fontSize: 18)),
              Text('WAKTU BUKA : 08:00 AM - 10:00 PM',
                  style: TextStyle(height: 1.5, fontSize: 18)),
              Text('FASILITAS : WC | TEMPAT SHOLAT',
                  style: TextStyle(height: 1.5, fontSize: 18)),
              SizedBox(height: 12,),
              MaterialButton(
                onPressed: (){},
                child: Text('LOCATION', style: TextStyle(
                    color: Colors.blue
                )
                ),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.blue,
                    width: 1,
                    style: BorderStyle.solid
                ), borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
        ),
SizedBox(height: 20,),

        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: RoundedButton(

            text: 'BOOKING',

            textColor: Colors.white,
            color: Colors.orange,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBooking(
              ),
              ),
              );
            },
        ),
        ),

      ],
    );
  }
}
_launchMap() async{

}

