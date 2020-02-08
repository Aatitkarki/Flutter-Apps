import 'package:flutter/material.dart';
import 'package:hamroroutine/view/note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>Note(NoteMode.Editing)
            ));
          },
                  child: Card(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[_NoteTitle(),
                Container(height:4),
                 _NoteText()],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: 
      (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
          Note(NoteMode.Adding)
        ));
      },
      child:Icon(Icons.add)),
    );
  }
}

class _NoteTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Some Text",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "lorem episum the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ips",
      style: TextStyle(color: Colors.blue.shade600),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
