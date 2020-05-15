
import 'package:flutter/material.dart';
import 'package:latestflightapp/HomeScreen/customAppBar.dart';

import 'DataList/flightList.dart';
import 'customshapeclipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flight Lists",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    );
  }
}

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xfff3791a), fontFamily: 'Oxygen');

Color firstColor = Color(0xfff47d15);
Color secondColor = Color(0xffef772c);
List locations = ["Tokyo (TK)", "New York City (NYC)", "Kathmandu (KTM)"];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: <Widget>[
            HomeScreenTopPart(),
            homeScreenButtomPart,
          ],
        ),
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  int selectedIndexValue = 0;
  bool isFlightSelected = true;
  final TextEditingController searchFieldController = TextEditingController(text:locations[2]);
  TextStyle dropDownLabelStyle = TextStyle(fontSize: 16, color: Colors.black);
  TextStyle dropDownMenuStyle = TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(width: 20),
                        PopupMenuButton(
                          color: Colors.orange,
                          onSelected: (index) {
                            setState(() {
                              selectedIndexValue = index;
                            });
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                locations[selectedIndexValue],
                                style: dropDownLabelStyle,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              )
                            ],
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(
                                locations[0],
                                style: dropDownMenuStyle,
                              ),
                              value: 0,
                            ),
                            PopupMenuItem(
                                child: Text(
                                  locations[1],
                                  style: dropDownMenuStyle,
                                ),
                                value: 1),
                            PopupMenuItem(
                                child: Text(
                                  locations[2],
                                  style: dropDownMenuStyle,
                                ),
                                value: 2),
                          ],
                        ),
                        Spacer(), //Spacer creates full gap between its items
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "  Where you \nwant to Travel?",
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      elevation: 5,
                      child: TextField(
                        controller: searchFieldController,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        cursorColor: appTheme.primaryColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            suffixIcon: Material(
                              elevation: 5,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InheritedFlightListing(fromLocation: locations[selectedIndexValue],toLocation: searchFieldController.text,child: FlightListingScreen(),)));
                                },child: Icon(Icons.search)),
                            )),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: ChoiceChip(
                            Icons.flight_takeoff, "Flight", isFlightSelected),
                        onTap: () {
                          setState(() {
                            isFlightSelected = true;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child:
                            ChoiceChip(Icons.hotel, "Hotel", !isFlightSelected),
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            widget.text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}

var viewAllTextStyle = TextStyle(fontSize: 18, color: appTheme.primaryColor);
var homeScreenButtomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Currently Watched Items",
              style: TextStyle(fontSize: 18, color: Colors.black)),
          Spacer(),
          Text("View All Items", style: viewAllTextStyle),
        ],
      ),
    ),
    Container(
      height: 240,
      child: ListView(scrollDirection: Axis.horizontal, children: cityCards),
    )
  ],
);

List<CityCard> cityCards = [
  CityCard("assets/images/andaman.jpg", "Andaman", "April 2020", "30", "18000",
      "12000"),
  CityCard(
      "assets/images/india.jpg", "India", "April 2020", "60", "10000", "4000"),
  CityCard(
      "assets/images/laos.jpg", "Laos", "April 2020", "20", "20000", "16000"),
];

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210,
                  width: 160,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: 0,
                    bottom: 0,
                    height: 90,
                    width: 160,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.black12])),
                    )),
                Positioned(
                    left: 10,
                    bottom: 10,
                    right: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              cityName,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              monthYear,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "$discount%",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                "Rs$newPrice",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(width: 10),
              Text(
                "Rs$oldPrice",
                
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,decoration: TextDecoration.lineThrough),
              ),
            ],
          )
        ],
      ),
    );
  }
}
