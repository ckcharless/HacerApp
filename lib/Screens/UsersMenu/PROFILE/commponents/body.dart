import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hacer/Screens/UsersMenu/PROFILE/commponents/profil_pic.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 10,),
        ProfilPic(),
        SizedBox(height: 10,),
        ProfilMenu(
            text: "DERRICK ROSE",
            icon: "assets/icons/name.svg"),

        ProfilMenu(
            text: "081234578454",
            icon: "assets/icons/phone.svg"),

        ProfilMenu(
            text: "MALE",
            icon: "assets/icons/gender.svg"),

        ProfilMenu(
            text: "4 OKTOBER 1988",
            icon: "assets/icons/birthday.svg"),

        ProfilMenu(
            text: "derrickrose@gmail.com",
            icon: "assets/icons/email.svg"),
      ],

    );
  }
}


class ProfilMenu extends StatelessWidget{
  const ProfilMenu({
    Key key,
    @required this.text,
    @required this.icon,
}) : super(key: key);

  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: () {},
        child: Row(
          children: [

            SvgPicture.asset(
              icon,
              width: 22,
              color: Colors.blue,
            ),
            SizedBox(width: 20,),
            Expanded(child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ),

          ],
        ),
      ),
    );
  }
}