import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/UsersMenu/HOME/DetailScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import '../../../models/detailLapangan.dart';

class UserHome extends StatefulWidget{
  UserHome({Key key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome>{

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
          child: TextField(

            style: TextStyle(color: Colors.white),

            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              icon: Icon(Icons.search,color: Colors.white,),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
            ),

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
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(),
                ),
              );
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
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        height: 136,
                        width: size.width - 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: Text(detailLapangan.title,
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
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22),
                                      topRight: Radius.circular(22))
                              ),
                              child: Text(
                                "\$${detailLapangan.price}",
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


