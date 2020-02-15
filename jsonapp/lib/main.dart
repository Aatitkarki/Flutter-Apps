import 'package:flutter/material.dart';
import 'package:jsonapp/pages/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamro Routine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            
          ),
          labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade700
          )
        )
      ),
      home: HomePage(),
    );
  }
}

