import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/AdminMenu/AdminPage.dart';
import 'package:hacer/Screens/AdminMenu/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import '../../../models/detailLapangan.dart';

class ManageField extends StatefulWidget{

  @override
  _ManageField createState() => _ManageField();
}


class _ManageField extends State<ManageField>{

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
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    detailLapangan: products[index],
                    press: () {
                      _awaitReturnFromDetail(context, index);
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

  void _awaitReturnFromDetail(BuildContext context, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(index: index,),
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
                height: 160,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[

                    Container(
                      height: 116,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: itemIndex.isEven ? kBlueColor : Colors.orange,
                        boxShadow: [BoxShadow(
                          spreadRadius: 4,
                          color: Colors.black45,
                          offset: Offset(2, 2),
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
                      top: 38,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        height: 90,
                        width: 180,
                        child: Image.asset(detailLapangan.image,
                          fit: BoxFit.cover,
                        ),

                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        height: 140,
                        width: size.width - 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text(detailLapangan.title.toUpperCase(),
                                style: TextStyle(fontSize: 17)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text('Price : ' + detailLapangan.price.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .button,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text('Description : ' + detailLapangan.description,
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


