import 'package:flutter/material.dart';
import 'package:hacer/routing_constant.dart';


class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
        children: [
          Text("BOOKING",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            BookingForm(),
        ],
    ),
      ),
    ),
    );
  }
}

class BookingForm extends StatefulWidget{
  @override
  _BookingForm createState() => _BookingForm();
}

class _BookingForm extends State<BookingForm>{
  String email;
  String name;
  String Phonenumber;
  String Adress;
  DateTime _dateTime;

  String valueChoose;
  List listtime = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
  ];

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
              child: Column(
                children: <Widget>[
                  Text(_dateTime == null ? 'Pilih tanggal' : _dateTime.toString().substring(0,10)),
                  RaisedButton(child: Text("select"),
                    onPressed: (){
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2500)
                      ).then((date){
                        setState(() {
                          _dateTime = date;
                        });
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
              child: DropdownButton(
                hint: Text("Waktu Sewa"),
                value: valueChoose,
                onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listtime.map((valueItem){
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
              child: TextField(
                decoration: const InputDecoration(

                  labelText: 'Lama penyewaan (dalam jam)',
                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide(
                      color: Colors.blue,

                    ),

                  ),
                  border: OutlineInputBorder(),


                ),
                onChanged: (value){
                  setState(() {
                    Adress =value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Tim',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  setState(() {
                    email =value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Jumlah anggota',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value){
                  setState(() {
                    name =value;
                  });
                },
              ),
            ),



            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),


              child: Row(
                children: [
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool value){
                      print(value);
                      setState(() {
                        checkBoxValue = value;
                      });
                    },

                  ),
                  Text("Sparing"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: MaterialButton(
                child: Text('SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                    )
                ),
                color: Colors.blue,
                onPressed: (){
                  print(email);
                  print(name);
                  print(Phonenumber);
                  print(Adress);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }}



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