import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Product Home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10, 2, 10),
        children: <Widget>[
          ProductBox(
              name: "iPhone",
              description: "Iphone is the most expensive phone ever",
              price: 1000,
              image: "iphone.png"),
          ProductBox(
              name: "Samsung",
              description: "Samsung is the best android phone ever",
              price: 800,
              image: "samsung.png"),
          ProductBox(
              name: "laptop",
              description: "laptop is the best android phone ever",
              price: 800,
              image: "laptop.png"),
          ProductBox(
              name: "pixel",
              description: "pixel is the best android phone ever",
              price: 800,
              image: "pixel.png"),
          ProductBox(
              name: "tablet",
              description: "tablet is the best android phone ever",
              price: 800,
              image: "tablet.png"),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  void _alertmessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert Message"),
            content: Text("This image is pressed"),
            actions: <Widget>[
              FlatButton(
                child: Text("close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  

  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  _alertmessage(context);
                },
                child: Image.asset("assets/image/" + image)),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
