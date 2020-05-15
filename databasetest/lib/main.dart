import 'dart:convert';

import 'package:databasetest/Model/taskdatamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final textController = TextEditingController();
  List <TaskModel> task =[];
  TaskModel currentTask;
  final ToDoHelper _toDoHelper = ToDoHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
            ),
            RaisedButton(onPressed:(){
              currentTask = TaskModel(name: textController.text);
                _toDoHelper.insertData(currentTask);

            },child: Text("Insert Data"),),
             RaisedButton(onPressed:()async{
                List<TaskModel> list =await _toDoHelper.getAllTask();

                setState(() {
                  task = list;
                });

            },child: Text("Show Data"),),
            Expanded(child: ListView.separated(itemBuilder: (context,index){
              return ListTile(
                leading: Text("${task[index].id}"),
                title: Text("${task[index].name}"),
              );
            }, separatorBuilder: (context,index)=>Divider(), itemCount: task.length))
          ],
        ),
      ),
      
    );
  }
}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List> jsonDataList () async{
    List data = [];
    var response =await http.get("https://jsonplaceholder.typicode.com/users");
    data = json.decode(response.body);
    print(data);
    return data;
  }
  @override
  void initState() {
    jsonDataList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          
        ),
      ),
    );
  }
}