import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String email;
  String name;
  String Phonenumber;
  String Adress;



  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('REGISTER'),
        ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 40.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
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
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
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
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                        Phonenumber =value;
                      });
                    },
                  ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      labelText: 'User Name',
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
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
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: MaterialButton(
                  child: Text('REGISTER',
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
      ),

    );
  }
}