import 'package:bookclub_application/pages/root/root.dart';
import 'package:bookclub_application/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrentUser _currentUser =
                    Provider.of<CurrentUser>(context, listen: false);
        
    return Scaffold(
      appBar: AppBar(
        title:  Text("Home PAge"),
        actions: [
          IconButton(
              onPressed: () async {
                
                String _returnString = await _currentUser.signOut();
                if (_returnString == "success") {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => OurRoot()),
                      (route) => false);
                }
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
    );
  }
}
