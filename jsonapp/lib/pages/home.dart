import 'package:flutter/material.dart';
import 'package:jsonapp/pages/noteedit.dart';

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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteEdit()));
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.wallpaper,
                            color: Colors.cyan,
                            size: 100,
                          ),
                          Text("WallPager")
                        ],
                      ),
                      onPressed: () {

                      }),
                  RaisedButton(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.person_add,
                            color: Colors.blue,
                            size: 100,
                          ),
                          Text("FaceBook")
                        ],
                      ),
                      onPressed: () {}),
                ],
              )
          ],
        ),
            )
    );
  }
}
