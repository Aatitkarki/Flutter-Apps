import 'package:flutter/material.dart';
import 'package:meronotes/firebase_auth.dart';
// import 'package:meronotes/model/note.dart';
import 'package:meronotes/model/test.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Notes")),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.chat,
                        color: Colors.blue,
                        size: 100,
                      ),
                      Text("Message")
                    ],
                  ),
                  onPressed: () {}),
              RaisedButton(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.note_add,
                        color: Colors.red,
                        size: 100,
                      ),
                      Text("Notes")
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteToFireBase()));
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.power_settings_new,
                        color: Colors.cyan,
                        size: 100,
                      ),
                      Text("Log Out")
                    ],
                  ),
                  onPressed: () {
                    AuthProvider().logOut();
                  }),
              RaisedButton(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.event_note,
                        color: Colors.blue,
                        size: 100,
                      ),
                      Text("Events")
                    ],
                  ),
                  onPressed: () {}),
            ],
          ),
        ],
      )),
    );
  }
}
