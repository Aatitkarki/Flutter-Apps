import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteAdd extends StatefulWidget {
  @override
  _NoteAddState createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  String title;
  String description;
  bool _validate = true;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final FocusNode descriptionfield = FocusNode();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text("Title Of Note",
                  style: TextStyle(fontSize: 25, color: Colors.pink)),
              SizedBox(
                height: 5,
              ),
              TextField(
                textInputAction: TextInputAction.next,
                controller: titleController,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(descriptionfield);
                },
                decoration: InputDecoration(
                    labelText: 'Enter the Title',
                    errorText:
                        titleController.text.isEmpty ? 'Title cannot be empty' : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Description Of Note",
                  style: TextStyle(fontSize: 25, color: Colors.pink)),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 100,
                child: TextField(
                  focusNode: descriptionfield,
                  maxLines: null,
                  expands: true,
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description of Note',
                      errorText: descriptionController.text.isNotEmpty ? null : 'Description cannot be empty',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1),
                      )),
                ),
              ),
              _noteButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _noteButtons() {
    return Container(
          child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 100,),
            RaisedButton(
                child: Text("Save"),
                onPressed: () {
                  title = titleController.text;
                  description = descriptionController.text;
                  validationCheck();
                  _validate == true
                      ? Firestore.instance.collection('Notes').document().setData(
                          {"title": "$title", "description": "$description"})
                      : print("Cnnot valiadate");
                  _validate ? clearText() : print("sECOND ERROR");
                  _validate ? pop() : print("Couldnot pop");
                }),
            RaisedButton(
                child: Text("Clear"),
                onPressed: () {
                  clearText();

                }),
                RaisedButton(
                child: Text("Exit"),
                onPressed: () {
                  clearText();
                  pop();

                }),
          ],
        ),
      ),
    );
  }

  void pop(){
    Navigator.of(context).pop();
  }

  void clearText() {
    titleController.clear();
    descriptionController.clear();
  }
  validationCheck(){
    if(titleController.text.isNotEmpty && descriptionController.text.isNotEmpty){
      print("String is not empty");
      setState(() {
        _validate = true;
      });
    }else{
      setState(() {
        _validate=false;
      });
      print("String is empty");
    }
  }
}
