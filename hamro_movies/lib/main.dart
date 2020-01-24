import 'package:flutter/material.dart';

import 'UI/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hamro Movies",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title:'Hamro Movies'),
      debugShowCheckedModeBanner: false,
    );
  }
}  
class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}):super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage()
    );
  }
}