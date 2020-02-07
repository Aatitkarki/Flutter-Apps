import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note")
      ),
      body: Padding(padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: 'Note Title'
            ),
          ),
         TextField(
           decoration: InputDecoration(
             hintText: 'Note Text'
           )
         ),
         Row(children: <Widget>[
           _NoteButton('Save',Colors.blue,(){}),
           _NoteButton('Discard',Colors.grey,(){}),
           _NoteButton('Delete',Colors.red,(){}),
         ],)
        ],
      ),),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onpressed;

  _NoteButton(this._text,this._color,this._onpressed);
  @override
  Widget build(BuildContext context) {
    return MaterialButton
    (
      child: Text(_text,style: TextStyle(
        color: Colors.white,
      )),
      color: _color,
      onPressed: _onpressed,

    );
  }
}