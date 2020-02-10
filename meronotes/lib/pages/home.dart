import 'package:flutter/material.dart';
import 'package:meronotes/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Notes")),
      body: Container(
        child: RaisedButton(
            child: Text("Log Out"),
            onPressed: () {
              AuthProvider().logOut();
            }),
      ),
    );
  }
}
