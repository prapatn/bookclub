// ignore_for_file: file_names

import 'package:bookclub_application/pages/home/home.dart';
import 'package:bookclub_application/pages/signup/signup.dart';
import 'package:bookclub_application/states/currentUser.dart';
import 'package:bookclub_application/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  OurLoginForm({Key? key}) : super(key: key);

  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                    _emailController.text, _passwordController.text, context);
              }),
          FlatButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OurSignUp()));
            },
            child: Text("Don't have an accont? Sign up here"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}

void _loginUser(String email, String password, BuildContext context) async {
  CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
  try {
    if (await _currentUser.loginUser(email, password)) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text("Incorect Login info"),
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
