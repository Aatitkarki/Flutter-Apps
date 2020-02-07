import 'package:flutter/material.dart';
import 'package:hamroroutine/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Hamro Routine',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: NoteList(),
      
    );
  }
}

