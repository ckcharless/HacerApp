import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';


class UserNotif extends StatefulWidget {
  UserNotif({Key key}) : super(key: key);

  @override
  _UserNotifState createState() => _UserNotifState();
}

class _UserNotifState extends State<UserNotif> {
  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(child:
            Container(
              height: 547,
              decoration: BoxDecoration(
                color: Colors.white,

              ),


          child: InkWell(
          child: Stack(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding / 3,
                  ),
                  //color: Colors.blueAccent,
                  height: 160,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[

                      Container(
                        height: 150,
                        decoration: BoxDecoration(

                          boxShadow: [BoxShadow(
                            spreadRadius: 1,
                            color: Colors.black45,
                            offset: Offset(1,12),
                            blurRadius: 10,
                          )],
                        ),
                        child: Container(

                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white70,

                          ),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding),
                          height: 90,
                          width: 180,
                          child: Image.asset("assets/images/lapangan1.jpg",
                            fit: BoxFit.cover,
                          ),

                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 136,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: Text("asd000",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .button,),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(

                                  horizontal: kDefaultPadding * 1.5,
                                  vertical: kDefaultPadding / 4,
                                ),
                                decoration: BoxDecoration(

                                    color: Colors.deepOrangeAccent,
                                ),
                                child: Text(
                                  "00000",
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
            ),

            ),

          ],
        ),
    );
  }
}