import 'package:flutter/material.dart';
import 'dart:convert';

class Note {
  final String title;
  final String description;

  Note(this.title, this.description);
}

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note List")),
      backgroundColor: Colors.blueGrey,
      body: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('load_json/notes.json'),
          builder: (context, snapshot) {
            var noteList = json.decode(snapshot.data.toString());
            return new ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(content: Text("Tap"));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          color: Colors.redAccent,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  noteList[index]["title"],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  noteList[index]["description"],
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        elevation: 10,
        tooltip: 'AddNote',
      ),
    );
  }
}
