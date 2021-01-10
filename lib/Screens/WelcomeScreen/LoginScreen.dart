import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hacer/Screens/AdminMenu/HomePage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:developer' as developer;
import '../../routing_constant.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen>
{
  TextEditingController usernameCtrl,passctrl;

  bool loginStatus = true;

  bool processing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameCtrl = new TextEditingController();
    passctrl = new TextEditingController();

  }

  void changeState(){
    if(loginStatus) {
      loginStatus = false;
    }
    else loginStatus = true;
  }

  void userSignIn() async{
    setState(() {
      processing = true;
    });
    var url = "http://10.209.147.123/hacer/login.php";
    var data = {
      "name":usernameCtrl.text,
      "password":passctrl.text,
    };

    var res = await http.post(url,body:data);
    Map<String, dynamic> login = jsonDecode(res.body);


    if(jsonDecode(res.body) == "dont have an account"){
      Fluttertoast.showToast(msg: "dont have an account,Create an account",toastLength: Toast.LENGTH_SHORT);
    }
    else{
      if(jsonDecode(res.body) == "false"){
        Fluttertoast.showToast(msg: "incorrect password",toastLength: Toast.LENGTH_SHORT);
      }
      else{
        if ('${login['errNum']}' == '0')
          {
            print(login);
            if('${login['role']}' == 'customer')
              {
                Navigator.pushNamed(context, UserHomeView);
              }
            else if ('${login['role']}' == 'admin')
              {
                Navigator.pushNamed(context, AdminHomeView);
              }
          }
        else
          {
            Alert(context: context, title: "Alert", desc: "Username or Password Invalid!").show();
          }
      }
    }

    setState(() {
      processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 320,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png')
                    )
                ),
              ),
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              RoundedInputField(

                  hintText: 'Username',
                  controller: usernameCtrl,

              ),
              RoundedPasswordInput(
                controller: passctrl,
              ),
              RoundedButton(
                  text: 'LOGIN',
                  textColor: Colors.white,
                  color: Color.fromRGBO(87, 87, 255, 1),
                  press: () {userSignIn();}
              ),RoundedButton(
                  text: 'REGISTER',
                  textColor: Colors.white,
                  color: Color.fromRGBO(255,140,0,1),
                  press: () {Navigator.pushNamed(context, RegisterScreenView);}
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.black),
              hintText: hintText,
              border: InputBorder.none
          )
      )
    );
  }
}

class RoundedPasswordInput extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordInput({
    Key key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Password',
          icon: Icon(Icons.lock, color: Colors.black),
          suffixIcon: Icon(Icons.visibility, color: Colors.black),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(224, 224, 255, 1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

