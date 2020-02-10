import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meronotes/pages/home.dart';
import 'package:meronotes/pages/loginpage.dart';

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
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser>snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator(
            backgroundColor: Colors.white,
          );
        }if(!snapshot.hasData||snapshot.data==null){
          return LoginPage();
        }return HomePage();
      },
      
    );
  }
}
