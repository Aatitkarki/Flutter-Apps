import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
           
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),),
               color: Colors.amberAccent,
            ),
          ),
          ListView(
            padding: EdgeInsets.fromLTRB(10, 150, 10, 0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Login",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Card(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.redAccent,
                          ),
                          hintText: "UserName",
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16)),
                    ),
                  ),
                  Card(
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.security,
                            color: Colors.redAccent,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    child: RaisedButton(
                      elevation: 11,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      color: Colors.pink,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text("Login",
                          style: TextStyle(color: Colors.white70)),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
