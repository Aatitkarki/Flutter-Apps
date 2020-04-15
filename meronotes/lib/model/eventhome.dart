import 'package:flutter/material.dart';

class EventHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
          child: CircleAvatar(
            maxRadius: 15,
            backgroundImage: AssetImage("images/sk.JPG"),
          ),)
        ],
      ),
    );
  }
}
