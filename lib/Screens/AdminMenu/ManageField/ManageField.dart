import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacer/Screens/AdminMenu/DetailLapanganScreen/detail_screen.dart';
import 'package:hacer/constans.dart';
import '../../../models/detailLapangan.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../routing_constant.dart';


class ManageField extends StatefulWidget{

  @override
  _ManageField createState() => _ManageField();
}


class _ManageField extends State<ManageField>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;

  _imgFromGallery() async {
    File image = (await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ));

    setState(() {
      _image = image;
    });
  }

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
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      AddFieldModal(context);
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green,
                  ),
                )
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
        builder: (context) => DetailScreen(product: products[index]),
      ),
    );
  }

  Future AddFieldModal(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          final TextEditingController _fieldName = TextEditingController();
          final TextEditingController _fieldPrice = TextEditingController();
          final TextEditingController _fieldDescription = TextEditingController();
          return StatefulBuilder(builder: (context,setState){
            return AlertDialog(
              title: Text('EDIT FIELD'),
              content: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: new RaisedButton(
                            onPressed: () {_imgFromGallery();},
                            child: new Text("Select Image"),
                          ),
                        ),
                        TextFormField(
                          controller: _fieldName,
                          validator: (value){
                            return value.isNotEmpty ? null : "Invalid Field";
                          },
                          decoration: InputDecoration(hintText: "Enter New Field Name"),
                        ),
                        TextFormField(
                          controller: _fieldPrice,
                          validator: (value){
                            return value.isNotEmpty ? null : "Invalid Field";
                          },
                          decoration: InputDecoration(hintText: "Enter New Price"),
                        ),
                        TextFormField(
                          controller: _fieldDescription,
                          validator: (value){
                            return value.isNotEmpty ? null : "Invalid Field";
                          },
                          decoration: InputDecoration(hintText: "Enter New Description"),
                        ),
                      ],
                    )
                  )
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      successAlert(context);
                    }
                  },
                ),
              ],
            );
          });
        });
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

successAlert(BuildContext context){
  Widget continueButton = FlatButton(
    child: Text("Ok"),
    onPressed:  () {
      Navigator.pushNamed(context, AdminHomeView);
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
