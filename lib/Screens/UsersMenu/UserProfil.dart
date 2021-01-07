import 'package:flutter/material.dart';

class UserProfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,

      body: Stack(
        alignment: Alignment.center,

        children: [
          Column(

            crossAxisAlignment:  CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(20),
                child: Text('Edit Profile',style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(

                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}