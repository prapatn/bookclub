import 'package:bookclub_application/pages/login/localwidgets/loginForm.dart';
import 'package:flutter/material.dart';

class OurLogin extends StatelessWidget {
  const OurLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset("assets/logo.png"),
                ),
                //SizedBox(height: 5.0,),
                
                OurLoginForm(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
