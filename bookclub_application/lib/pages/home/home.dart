import 'package:bookclub_application/pages/noGroup/noGroup.dart';
import 'package:bookclub_application/pages/root/root.dart';
import 'package:bookclub_application/states/currentUser.dart';
import 'package:bookclub_application/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => OurRoot()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: OurContainer(
                child: Column(
              children: [
                Text(
                  "Harry Potter and the devil Stone",
                  style: TextStyle(color: Colors.grey[600], fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Due In : ",
                        style: TextStyle(color: Colors.grey[600], fontSize: 20),
                      ),
                      Text(
                        "8 Days",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RaisedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Finished Book",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: OurContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Next Book Revealed In : ",
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                    Text(
                      "22 Hours",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RaisedButton.icon(
                onPressed: () => _goToNoGroup(context),
                icon: const Icon(
                  Icons.history_rounded,
                  color: Colors.white,
                ),
                label: const Text(
                  "Book Club History",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RaisedButton.icon(
                color: Theme.of(context).canvasColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: 2)),
                onPressed: () {
                  _signOut(context);
                },
                icon: const Icon(Icons.exit_to_app_sharp),
                label: const Text("Sign Out")),
          ),
        ],
      ),
    );
  }

  void _goToNoGroup(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OurNoGroup()));
  }
}
