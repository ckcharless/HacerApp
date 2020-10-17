import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<LoginScreen>
{
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String userName, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    this.userName = "admin";
    this.password = "admin";
    final response = await http.post("http://192.168.1.5/hacer/login.php",
        headers: {"Accept":"application/json"},
        body: {"username": userName, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String usernameAPI = data['username'];
    String namaAPI = data['nama'];
    String id = data['id'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, usernameAPI, namaAPI, id);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String username, String nama, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("email", username);
      preferences.setString("id", id);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onChanged: (e) => this.userName = e,
              ),
              RoundedPasswordInput(
                onChanged: (e) => password = e,
              ),
              RoundedButton(
                  text: 'LOGIN',
                  textColor: Colors.white,
                  color: Color.fromRGBO(87, 87, 255, 1),
                  press: () {login();}
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
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
          onSaved: onChanged,
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
  const RoundedPasswordInput({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
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
    Size size = MediaQuery.of(context).size;
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

