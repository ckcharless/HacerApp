import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailLapangan.dart';
import 'package:hacer/Screens/AdminMenu/ManageField/ManageField.dart';
import 'package:hacer/Screens/AdminMenu/AdminPage.dart';

import '../../../routing_constant.dart';

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
          height: 500,
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
              Text(product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Spacer(),
              Text('HARGA : Rp ' + product.price.toString() + '/ jam'),
              Spacer(),
              Text('WAKTU BUKA : ' + product.openTime + ' - ' + product.closeTime),
              Spacer(),
              Text('FASILITAS : ' + product.facility),
              Spacer(),
              Text('Description : ' + product.description),
              Spacer()
            ],
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: 1,
          ),
          child:  RaisedButton(
            onPressed: () {EditModal(context);},
            child: Text(
                'EDIT'
            ),
            color: Colors.orangeAccent,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ),
        Container(
          width: 500,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: 1,
          ),
          child:  RaisedButton(
              onPressed: () {deleteField(context);},
              child: Text(
                  'DELETE'
              ),
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
      ],
    );
  }
}
_launchMap() async{

}

deleteField(BuildContext context){
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {Navigator.of(context).pop();},
  );
  Widget continueButton = FlatButton(
    child: Text("Confirm"),
    onPressed:  () {successAlert(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("DELETE"),
    content: Text("Are you sure to delete this field ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
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

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Future EditModal(BuildContext context) async {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                )),
            actions: <Widget>[
              TextButton(
                child: Text('Okay'),
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    // Do something like updating SharedPreferences or User Settings etc.
                    successAlert(context);
                  }
                },
              ),
            ],
          );
        });
      });
}