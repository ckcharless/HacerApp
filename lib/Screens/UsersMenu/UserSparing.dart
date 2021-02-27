import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/UsersMenu/HOME/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';

class UserSparing extends StatefulWidget{
  UserSparing({Key key}) : super(key: key);

  @override
  _UserSparingState createState() => _UserSparingState();
}

class _UserSparingState extends State<UserSparing>{

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child : Column(
        children: <Widget>[

          SizedBox(height: 10,),
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
                  itemCount: 4,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    press: () {},
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
    Key key, this.itemIndex, this.press,
  }) : super(key: key);

  final int itemIndex;

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
      height: 130,


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
                        color: itemIndex.isEven ? kBlueColor : Colors.orange,

                      ),
                      child: Container(

                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.yellow[50],


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
                              Text("CODE BOOKING : ABCDEF",
                                  style: TextStyle(height: 1, fontSize: 20)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text("Champion Futsal, Kebun Jeruk, Jakarta Barat",
                                  style: TextStyle(height: 1.5, fontSize: 14,fontWeight: FontWeight.bold)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text("TEAM A : 7 PEOPLE",
                                  style: TextStyle(height: 1.6, fontSize: 16)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text("DURATION : 2 HOURS",
                                  style: TextStyle(height: 1.4, fontSize: 16)),



                            ),

                            SizedBox(height: 15,),





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


