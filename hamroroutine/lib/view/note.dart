import 'package:flutter/material.dart';

enum NoteMode { Adding, Editing }

class Note extends StatelessWidget {
  final NoteMode _noteMode;
  Note(this._noteMode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_noteMode == NoteMode.Adding ? 'Add Note' : 'Edit Note')),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            TextField(decoration: InputDecoration(hintText: 'Note Text')),
            Container(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  Navigator.pop(context);
                }),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                _noteMode == NoteMode.Editing
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _NoteButton('Delete', Colors.red, () {
                          Navigator.pop(context);
                        }),
                    )
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {
  final String _text;
  final Color _color;
  final Function _onpressed;

  _NoteButton(this._text, this._color, this._onpressed);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(_text,
          style: TextStyle(
            color: Colors.white,
          )),
      color: _color,
      onPressed: _onpressed,
      height: 40,
      minWidth: 100,
    );
  }
}
