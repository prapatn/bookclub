// ignore_for_file: file_names

import 'package:bookclub_application/pages/signup/signup.dart';
import 'package:bookclub_application/states/currentUser.dart';
import 'package:bookclub_application/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Full Name",
              )),
          const SizedBox(
            height: 20.0,
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
            obscureText: true,
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _confirmpasswordController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Confirm Password",
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 20.0,
          ),
          RaisedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              onPressed: () {
                if (_passwordController.text ==
                    _confirmpasswordController.text) {
                  _signUpUser(
                      _emailController.text, _passwordController.text, context);
                } else {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Password not macth"),
                    duration: Duration(seconds: 3),
                  ));
                }
              }),
        ],
      ),
    );
  }
}

void _signUpUser(String email, String password, BuildContext context) async {
  CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
  try {
    String _return = await _currentUser.signUpUser(email, password);
    if (_return=="success") {
      
      Navigator.pop(context);
     
    }else{
      Scaffold.of(context).showSnackBar( SnackBar(
        content: Text(_return),
        duration: const Duration(seconds: 3),
      ));
    }
  } catch (e) {
    print(e);
  }
}

// class SignUpForm extends StatelessWidget {
//   const SignUpForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {}
// }
