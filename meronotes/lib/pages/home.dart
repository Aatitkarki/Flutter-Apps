import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meronotes/firebase_auth.dart';
import 'package:meronotes/model/NoteListPage.dart';
import 'package:meronotes/model/devinfo.dart';
import 'package:meronotes/pages/passwords.dart';

class HomePage extends StatelessWidget {
  final TextStyle dtstyle = TextStyle(fontSize: 18, color: Color(0xFFe67e22));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Notes")),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Container(
              child: CircleAvatar(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("images/sk.JPG",),
                ),
              ),
            )),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xFF9b59b6)),
              title: Text(
                "Home",
                style: dtstyle,
              ),
              onTap: () {},
            ),
            Divider(height: 10, thickness: 3),
            ListTile(
              leading: Icon(Icons.mail, color: Color(0xFF9b59b6)),
              title: Text(
                "Contact Us",
                style: dtstyle,
              ),
              onTap: () {},
            ),
            Divider(height: 10, thickness: 3),
            ListTile(
              leading: Icon(Icons.settings, color: Color(0xFF9b59b6)),
              title: Text(
                "Setting",
                style: dtstyle,
              ),
              onTap: () {},
            ),
            Divider(
              height: 10,
              thickness: 3,
            ),
            ListTile(
              leading: Icon(Icons.person, color: Color(0xFF9b59b6)),
              title: Text(
                "Deverloper Info",
                style: dtstyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeveloperInfo()));
              },
            ),
            Divider(
              height: 10,
              thickness: 3,
            ),
          ],
        ),
      ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Notes()));
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.event_note,
                      color: Colors.blue,
                      size: 100,
                    ),
                    Text("Vault")
                  ],
                ),
                onDoubleTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PassCodeScreen()));
                },
              )
            ],
          ),
        ],
      )),
    );
  }
}
