import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/AdminMenu/AdminPage.dart';
import 'package:hacer/Screens/AdminMenu/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import '../../../models/detailBooking.dart';

class BookingDetail extends StatefulWidget{
  final int id;
  const BookingDetail({Key key, this.id}) : super(key: key);

  @override
  _BookingDetail createState() => _BookingDetail(this.id);
}

class _BookingDetail extends State<BookingDetail>{
  String dropdown = 'Jan';
  final int id;
  _BookingDetail(this.id);


  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child : Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),)
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, id) => ProductCard(
                    itemIndex: 1,
                    detailLapangan: products[1],
                  ),
                ),

              ],
            ),

          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key, this.itemIndex, this.detailLapangan,this.press,
  }) : super(key: key);

  final int itemIndex;
  final Product detailLapangan;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(


    );
  }
}


