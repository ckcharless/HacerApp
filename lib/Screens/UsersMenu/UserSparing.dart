import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/UsersMenu/HOME/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/routing_constant.dart';

import 'package:hacer/models/detailBooking.dart';

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
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    detailBooking: products[index],
                    press: () {
                      JoinSparing(context);
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
    Key key, this.itemIndex,this.detailBooking, this.press,
  }) : super(key: key);

  final int itemIndex;
  final Product detailBooking;
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
                              Text("\CODE BOOKING : ${detailBooking.bookCode}",
                                  style: TextStyle(height: 1, fontSize: 20)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text(detailBooking.address,
                                  style: TextStyle(height: 1.5, fontSize: 14,fontWeight: FontWeight.bold)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text("\TEAM A : ${detailBooking.teamA} PEOPLE",
                                  style: TextStyle(height: 1.6, fontSize: 16)),



                            ),
                            Container(

                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child:
                              Text("\DURATION : ${detailBooking.duration} HOURS",
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

successAlert(BuildContext context){
  Widget continueButton = FlatButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.pushNamed(context, UserHomeView);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('SUCCESS!!'),
    content: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/icons8-ok-480.png',
            fit: BoxFit.cover,
            height: 200,
          ),
        ]
    ),
    actions: [
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Future JoinSparing(BuildContext context) async {
  Widget continueButton = FlatButton(
    child: Text("Join"),
    onPressed:  () {
      if(_formKey.currentState.validate()){
        // Do something like updating SharedPreferences or User Settings etc.
        successAlert(context);
      }
    },
  );

  Widget resetButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      _formKey.currentState.reset();
    },
  );

  return await showDialog(context: context,
      builder: (context){
        final TextEditingController _fieldName = TextEditingController();
        final TextEditingController _fieldPrice = TextEditingController();
        final TextEditingController _fieldDescription = TextEditingController();
        return StatefulBuilder(builder: (context,setState){
          return AlertDialog(
            title: Text('Sparing'),
            content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Apakah anda tertarik untuk join sparing ?')


                  ],
                )),
            actions: <Widget>[
              continueButton,
              resetButton,
            ],
          );
        });
      });
}