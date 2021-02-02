import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacer/constans.dart';
import 'package:hacer/models/detailBooking.dart';

import '../../../routing_constant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 525,
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
                      'assets/images/logo.png',
                      height: 150,
                      width: 450,
                    ),
                  ],
                ),
              ),
              Text('Book Code : ' + product.bookCode,
                style: TextStyle(fontSize: 30),
              ),
              Spacer(),
              Text('Date : ' + product.date),
              Spacer(),
              Text('Time : ' + product.time),
              Spacer(),
              Text('Duration : ' + product.duration.toString() + ' Hours'),
              Spacer(),
              Text('Total Price : Rp ' + product.totalPrice.toString() ),
              Spacer(),
              Text('Description : ' + product.description),
              Spacer(),
              Text('Team Information',
                style: TextStyle(fontSize: 30),
              ),
              Spacer(),
              Text('Person in Charge : Hanafi'),
              Spacer(),
              Text('PIC Phone : 0813xxxxxxxx'),
              Spacer(),
              Text('PIC Email : Hanafi@xxx.xxx'),
              Spacer(),
              Text('Total Team : ' + product.teamA.toString()),
              Spacer()
            ],
          ),
        ),
        Container(
          width: 500,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: 1,
          ),
          child:  RaisedButton(
            onPressed: () {PaymentModal(context);},
            child: Text(
                'PAYMENT'
            ),
            color: Colors.orangeAccent,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          ),
        ),
      ],
    );
  }

  final Product product;
  const Body({Key key, this.product}) : super(key: key);
}
_launchMap() async{

}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Future PaymentModal(BuildContext context) async {
  return await showDialog(context: context,
      builder: (context){
        final TextEditingController _payAmount = TextEditingController();
        return StatefulBuilder(builder: (context,setState){
          return AlertDialog(
            title: Text('PAYMENT'),
            content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _payAmount,
                      validator: (value){
                        return value.isNotEmpty ? null : "Invalid Field";
                      },
                      decoration: InputDecoration(hintText: "Enter Payment Amount"),
                    ),
                  ],
                )),
            actions: <Widget>[
              TextButton(
                child: Text('Pay'),
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
