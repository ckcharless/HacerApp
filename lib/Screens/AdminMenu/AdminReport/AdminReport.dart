import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/AdminMenu/AdminPage.dart';
import 'package:hacer/Screens/AdminMenu/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import '../../../models/detailBooking.dart';

class AdminReport extends StatefulWidget{
  AdminReport({Key key}) : super(key: key);

  @override
  _AdminReport createState() => _AdminReport();
}

class _AdminReport extends State<AdminReport>{
  String dropdown = 'Jan';

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child : Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.all(kDefaultPadding),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300,
            child: new DropdownButton(
              value: dropdown,
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
              iconSize: 24,
              elevation: 0,
              style: TextStyle(color: Colors.black),
              onChanged: (String newValue) {
                setState(() {
                  dropdown = newValue;
                });
              },
              items: <String>['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dec']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 3,
            ),
            child: new Column(
              children: [
                new Container(
                  padding:  new EdgeInsets.only(top: 5.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                          'TOTAL BOOKING : 2',
                          style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          )
                      ),
                      new Text(
                          '     TOTAL SALES : 3000',
                          style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

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
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    detailLapangan: products[index],
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
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 90,
      ),
      height: 154,

      child: InkWell(
        onTap: press,
        child: Stack(
            children: <Widget>[

              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding / 3,
                ),
                //color: Colors.blueAccent,
                height: 200,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[

                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: itemIndex.isEven ? kBlueColor : Colors.orange,
                        boxShadow: [BoxShadow(
                          spreadRadius: 2,
                          color: Colors.black45,
                          offset: Offset(1, 2),
                          blurRadius: 10,
                        )],
                      ),
                      child: Container(

                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),

                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        height: 90,
                        width: size.width - 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text('Book Code : ' + detailLapangan.bookCode,
                                style:
                                  TextStyle(fontSize: 20),),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text("Date : " + detailLapangan.date + "         Time : " + detailLapangan.time,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .button,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text("Duration : " + detailLapangan.duration.toString() + " Hours",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .button,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      left: 0,
                      child: SizedBox(
                        height: 90,
                        width: size.width - 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text('Total Price : ' + detailLapangan.totalPrice.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .button,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text("Number Of Team : " + detailLapangan.teamA.toString() + "           Status : " + detailLapangan.paymentStatus,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .button,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]
        ),
      ),


    );
  }
}


