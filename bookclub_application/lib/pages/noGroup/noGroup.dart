// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OurNoGroup extends StatelessWidget {
  const OurNoGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _gotoJoin() {}
    ;
    void _gotoCreate() {}
    ;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: EdgeInsets.all(80.0),
              child: Image.asset("assets/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Welcome to Book Club",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Since you are not in a book club, you can select either " +
                  "to join a club or create a club.",style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,),
            ),
            const Spacer(
              flex: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Theme.of(context).canvasColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 2)),
                    onPressed: () {
                      _gotoCreate();
                    },
                    child: Text("Create"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _gotoJoin();
                    },
                    child: Text(
                      "Join",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
