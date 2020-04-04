import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PasswordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Passwords"),
        ),
        body: Passwords());
  }
}

class Passwords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Password').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            );
          default:
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemExtent: 80,
              itemBuilder: (context, index) =>
                  _passwordListItems(context, snapshot.data.documents[index]),
            );
        }
      },
    );
  }

  Widget _passwordListItems(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              document["title"],
              style: TextStyle(fontSize: 20),
            ),
            Text(
              document["password"],
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
