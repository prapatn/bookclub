// ignore_for_file: file_names

import 'package:bookclub_application/pages/home/home.dart';
import 'package:bookclub_application/pages/signup/signup.dart';
import 'package:bookclub_application/states/currentUser.dart';
import 'package:bookclub_application/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoginType {
  email,
  google,
}

class OurLoginForm extends StatefulWidget {
  OurLoginForm({Key? key}) : super(key: key);

  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget _googleButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        side: BorderSide(color: Colors.grey),
      ),
      onPressed: () {
        _loginUser(type: LoginType.google, context: context);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Image(
              image: AssetImage("assets/google_logo.png"),
              height: 25.0,
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Sing in with Google",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.alternate_email),
                hintText: "Email",
              )),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Password",
              ),
              obscureText: true),
          const SizedBox(
            height: 20.0,
          ),
          RaisedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Log in",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              onPressed: () {
                _loginUser(
                    type: LoginType.email,
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
              }),
          FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OurSignUp()));
            },
            child: Text("Don't have an accont? Sign up here"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          SizedBox(height: 10,),
          _googleButton(),
        ],
      ),
    );
  }
}

void _loginUser(
    {required LoginType type,
    String? email,
    String? password,
    required BuildContext context}) async {
  CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
  try {
    String? _return;
    switch(type){
      case LoginType.email:
        _return = await _currentUser.loginUserWithEmail(email!, password!);
        break;
      case LoginType.google:
        _return = await _currentUser.loginUserWithGoogle();
        break;
      default:
    }
    
    if (_return == "success") {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(_return!),
        duration: Duration(seconds: 3),
      ));
    }
  } catch (e) {
    print(e);
  }
}
// class OurLoginForm extends StatelessWidget {
//   OurLoginForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
