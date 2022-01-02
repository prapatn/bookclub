
import 'package:bookclub_application/pages/home/home.dart';
import 'package:bookclub_application/pages/login/login.dart';
import 'package:bookclub_application/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  const OurRoot({ Key? key }) : super(key: key);

  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {

  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  
    //get the status , check current user
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);
    String _returnString = await _currentUser.onStartUp();
    if(_returnString=="success"){
      setState(() {
         _authStatus = AuthStatus.loggedIn;
      });
     
    }else{

    }

  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch(_authStatus){
      case AuthStatus.notLoggedIn:
        retVal=OurLogin();
        break;
      case AuthStatus.loggedIn:
        retVal=HomePage();
        break;  
    }
    return retVal;
  }
}