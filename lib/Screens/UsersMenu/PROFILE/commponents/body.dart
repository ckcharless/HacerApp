import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       SizedBox(
         height: 115,
         width: 115,
         child: CircleAvatar(
           backgroundImage: AssetImage("assets/images/fotoprofil.jpg"),
         ),
       ),


     ],

   );
  }
}