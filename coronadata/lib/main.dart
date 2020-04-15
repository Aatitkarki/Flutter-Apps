import 'package:coronadata/countrydata.dart';
import 'package:coronadata/data/currentStats.dart';
import 'package:coronadata/devinfo.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'data/countriesDataList.dart';
import 'data/dataLoader.dart';

void main() => runApp(MyApp());

bool loading = false;


class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List lstCountry= getCountriesData();
  @override
  Widget build(BuildContext context) {
    final TextStyle dtstyle = TextStyle(fontSize: 18, color: Color(0xFFe67e22));
    return loading? Column(
      children: <Widget>[
        Center(
          heightFactor: 20,
          child: CircularProgressIndicator()),
      ],
    ): MaterialApp(
      debugShowCheckedModeBanner: false,
         home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Corona Nepal"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              text: "Live Country Data",
            ),
            Tab(
              text: "Home Page",
            ),
            
          ]),
        ),
        backgroundColor: Color(0xff34495e),
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Container(
              child: CircleAvatar(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    "images/sk.JPG",
                  ),
                ),
              ),
            )),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xFF9b59b6)),
              title: Text(
                "Home",
                style: dtstyle,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 10, thickness: 3),
            ListTile(
              leading: Icon(FontAwesomeIcons.globe, color: Color(0xFF9b59b6)),
              title: Text(
                "Details of All countries",
                style: dtstyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            Divider(height: 10, thickness: 3),
            ListTile(
              leading: Icon(Icons.person, color: Color(0xFF9b59b6)),
              title: Text(
                "Deverloper Info",
                style: dtstyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeveloperInfo()));
              },
            ),
            Divider(
              height: 10,
              thickness: 3,
            ),
          ],
        ),
      ),
        body: TabBarView(children: [
          CountryData(lstCountry: lstCountry),
          CurrentStats(),
          
        ]),
      ),
    ));
  }
}
