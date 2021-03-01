import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/UsersMenu/HOME/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailBooking.dart';

import 'package:hacer/models/detailNotifuser.dart';

class UserNotif extends StatefulWidget{
  UserNotif({Key key}) : super(key: key);

  @override
  _UserNotifState createState() => _UserNotifState();
}

class _UserNotifState extends State<UserNotif>{

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
                  itemCount: NotifUsers.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    detailNotifuser: NotifUsers[index],
                    press: () {

                    },
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
    Key key, this.itemIndex,this.detailNotifuser, this.press,
  }) : super(key: key);

  final int itemIndex;
  final NotifUser detailNotifuser;
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
      height: 195,


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
                height: 500,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[

                    Container(
                      height: 286,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.greenAccent,

                      ),
                      child: Container(

                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(219, 255, 220, 1),


                          borderRadius: BorderRadius.circular(22),

                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        height: 265,
                        width: size.width - 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text(detailNotifuser.status,
                                  style: TextStyle(height: 1, fontSize: 20)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text(detailNotifuser.alamat,
                                  style: TextStyle(height: 1.5, fontSize: 14,fontWeight: FontWeight.bold)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text("\PRICE : Rp ${detailNotifuser.price},-",
                                  style: TextStyle(height: 1.6, fontSize: 16)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text(detailNotifuser.date,
                                  style: TextStyle(height: 1.4, fontSize: 16)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text(detailNotifuser.bookingcode,
                                  style: TextStyle(height: 1.4, fontSize: 16)),



                            ),




                            SizedBox(height: 8,),

                            Container(
                              padding: EdgeInsets.symmetric(

                                horizontal: kDefaultPadding * 2.5,
                                vertical: kDefaultPadding / 8,
                              ),
                              decoration: BoxDecoration(

                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22),
                                      topRight: Radius.circular(22))
                              ),
                              child: Text(
                                detailNotifuser.time,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .button,
                              ),
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


