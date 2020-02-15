import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class NoteEdit extends StatefulWidget {
  @override
  _NoteEditState createState() => _NoteEditState();
}

class _NoteEditState extends State<NoteEdit> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  File jsonFile;
  Directory dir;
  String fileName = 'notelist.json';
  bool fileExists = false;

  Map<String,String> fileContent;
  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory){
      dir=directory;
      jsonFile = File(dir.path+"/"+fileName);
      fileExists = jsonFile.existsSync();

      if(fileExists) this.setState(()=>fileContent = json.decode(jsonFile.readAsStringSync()));
    });
  }
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createFile(Map<String,String>content,Directory dir, String fileName){
    print("Creating File");
    File file = File(dir.path+"/"+fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(json.encode(content));
  }
  
  void writeToFile(String title,String description){
    
    print("Writing to File");
    Map<String,String>content = {title:description};
    if(fileExists){
      print("File Exists");
      Map<String,String>jsonFileContent=json.decode(jsonFile.readAsStringSync());
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }else{
      print("File Doesnot Exists");
      createFile(content,dir,fileName);
    }
    this.setState(()=>fileContent=json.decode(jsonFile.readAsStringSync()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(fileContent.toString()),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter the Title'),
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Description of Note'),
            ),
            
            RaisedButton(
              child: Text("Submit"),onPressed: (){
              writeToFile(titleController.text,descriptionController.text);
            })
          ],
        ),
      ),
    );
  }
}
