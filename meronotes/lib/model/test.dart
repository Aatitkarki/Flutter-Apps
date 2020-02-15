import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WriteToFireBase extends StatefulWidget {
  @override
  _WriteToFireBaseState createState() => _WriteToFireBaseState();
}

class _WriteToFireBaseState extends State<WriteToFireBase> {
  final dBRef = FirebaseDatabase.instance.reference();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Writing to FireBase"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
             TextField(
               controller: titleController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter the Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Description of Note'),
            ),

            Wrap(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    writeData(titleController.text,descriptionController.text);
                    titleController.clear();
                    descriptionController.clear();
                  },
                  child: Text("Write Data"),
                ),
                RaisedButton(
                  onPressed: () {
                    readData();
                  },
                  child: Text("Read Data"),
                ),
                RaisedButton(
                  onPressed: () {
                    updateData();
                  },
                  child: Text("Update Data"),
                ),
                RaisedButton(
                  onPressed: () {
                    deleteData();
                  },
                  child: Text("Delete Data"),
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  NotesList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void writeData(String title,String desc) {
    dBRef.child("Notes").set({'Title': '$title', 'Desc': '$desc'});
    titleController.clear();
    descriptionController.clear();
  }

  void readData(){
    dBRef.once().then((DataSnapshot dataSnapshot){
      print(dataSnapshot.value);
      
    });
  }

  void updateData(){
    dBRef.child("1").update({
      'Desc':'descriptionController'
    });
  }
  void deleteData(){
    dBRef.child("1").remove();
  }
}
// This is note list using firestore
class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Notes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['title']),
                  subtitle: new Text(document['description']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}