import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Country {
  final String countryName;
  final int infected;
  final int recovered;
  final int death;

  Country(
    this.countryName,
    this.infected,
    this.recovered,
    this.death,
  );
}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  bool loading = true;
  bool loading2 = true;
  List<Country> countryData = [];
  Future<List<Country>> getCountryData() async {
    var response = await http
        .get("https://coronavirus-tracker-api.herokuapp.com/v2/locations");
    var jsonData = json.decode(response.body);

    for (var countries in jsonData["locations"]) {
      Country country = Country(
        countries["country"],
        countries["latest"]["confirmed"],
        countries["latest"]["recovered"],
        countries["latest"]["deaths"],
      );
      countryData.add(country);
      //The regexp takes the parameter to remove and teh next parameter takes by what to replace
    }

    if (this.mounted) {
      setState(() {
        loading2 = false;
      });
    }
    return countryData;
  }

  @override
  void initState() {
    super.initState();
    getCountryData();
    loading=false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
            title: Text('Tabs Demo'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
            ],
          ),
          body: TabBarView(
            children: [
              loading
                  ? Center(child: CircularProgressIndicator())
                  : getFutureBuilder(countryData),
              loading2
                  ? Center(child: CircularProgressIndicator())
                  : specificDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget specificDetails() {
    int mostInfectedNumber = countryData[0].infected;
    String mostInfectedCountry = countryData[0].countryName;
    int mostDeathNumber = countryData[0].death;
    String mostDeathCountry = countryData[0].countryName;
    int mostRecoveredNumber = countryData[0].recovered;
    String mostRecoveredCountry = countryData[0].countryName;
    for (var data in countryData) {
      if (mostInfectedNumber < data.infected) {
        mostInfectedNumber = data.infected;
        mostInfectedCountry = data.countryName;
      }
      if (mostDeathNumber < data.death) {
        mostDeathNumber = data.death;
        mostDeathCountry = data.countryName;
      }
      if (mostRecoveredNumber < data.recovered) {
        mostRecoveredNumber = data.recovered;
        mostRecoveredCountry = data.countryName;
      }
    }

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Most infected Country"),
              Text(mostInfectedCountry),
              Text(mostInfectedNumber.toString()),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Most Death Country"),
              Text(mostDeathCountry),
              Text(mostDeathNumber.toString()),
            ],
          ),
          Row(
            children: <Widget>[
              Text("Most Recovered Country"),
              Text(mostRecoveredCountry),
              Text(mostRecoveredNumber.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

Widget getFutureBuilder(List data) {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {
      return getCountryDetails(
        data[index].countryName,
        data[index].infected,
        data[index].recovered,
        data[index].death,
      );
    },
  );
}

Widget getCountryDetails(
  String countryName,
  int infected,
  int recovered,
  int death,
) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        Text(
          countryName,
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Infected\n" + infected.toString()),
            Text("Recovered\n" + recovered.toString()),
            Text("death\n" + death.toString()),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}
