import 'package:bookclub_application/pages/signup/localwidgets/signupForm.dart';
import 'package:flutter/material.dart';

class OurSignUp extends StatelessWidget {
  const OurSignUp({ Key? key }) : super(key: key);

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
              children:  <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: const [
                   BackButton(),
                 ],
               ),
               SizedBox(height: 40.0,),
               SignUpForm(),



              ],
            ),
          ))
        ],
      ),
    );
  }
}