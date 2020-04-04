import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meronotes/model/noteAdd.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),

      backgroundColor: Color(0xFF34495e),
      body: NotesList(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NoteAdd()));
          }),
    );
  }
}

// This is note list using firestore
class NotesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Notes').snapshots(),
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
                  _buildListItem(context, snapshot.data.documents[index]),
            );
        }
      },
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
            children: <Widget>[
              Text(
                document["title"],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                document["description"],
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
      onLongPress: () {
        deleteData(document.documentID);
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => noteUpdate(context, document)));
      },
    );
  }

  Widget noteUpdate(BuildContext context, DocumentSnapshot document) {
    String title;
    String description;
    bool _validate = true;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    titleController.text = document["title"];
    descriptionController.text = document["description"];
    final FocusNode descriptionfield = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text("Title Of Note",
                    style: TextStyle(fontSize: 25, color: Colors.pink)),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: titleController,
                  onEditingComplete: () {
                    FocusScope.of(context).requestFocus(descriptionfield);
                  },
                  decoration: InputDecoration(
                      labelText: 'Edit the Title',
                      errorText: titleController.text.isEmpty
                          ? 'Title cannot be empty'
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Edit the Description",
                    style: TextStyle(fontSize: 25, color: Colors.pink)),
                SizedBox(
                  height: 100,
                  child: TextField(
                    focusNode: descriptionfield,
                    maxLines: null,
                    expands: true,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: 'Description of Note',
                        errorText: descriptionController.text.isNotEmpty
                            ? null
                            : 'Description cannot be empty',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        title = titleController.text;
                        description = descriptionController.text;
                        _validate = validationCheck(
                            titleController, descriptionController);
                        _validate == true
                            ? updateData(
                                document.documentID, title, description)
                            : print("");
                        _validate == true
                            ? Navigator.of(context).pop()
                            : print("");
                        titleController.clear();
                        descriptionController.clear();
                      },
                      child: Text("Update"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        title = titleController.text;
                        description = descriptionController.text;
                        deleteData(document.documentID);
                        Navigator.of(context).pop();
                      },
                      child: Text("Delete"),
                    ),
                    RaisedButton(
                        child: Text("Exit"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  deleteData(docID) {
    Firestore.instance
        .collection("Notes")
        .document(docID)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  updateData(selectedDocId, title, description) {
    Firestore.instance.collection("Notes").document(selectedDocId).updateData(
        {"title": "$title", "description": "$description"}).catchError((e) {
      print(e);
    });
  }

  bool validationCheck(TextEditingController titleController,
      TextEditingController descriptionController) {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
