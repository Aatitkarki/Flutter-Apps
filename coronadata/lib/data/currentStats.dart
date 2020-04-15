import 'dart:convert';
import 'dart:ffi';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class CurrentStats extends StatefulWidget {
  @override
  _CurrentStatsState createState() => _CurrentStatsState();
}

class _CurrentStatsState extends State<CurrentStats> {
  final color = const Color(0xfff39c12);
  bool loading = true;
  bool loadingS = true;
  List dataNepal;
  List dataWorld;
  @override
  void initState() {
    super.initState();
    getDataNepal();
    worldData();
  }

  Future<Void> getDataNepal() async {
    var response = await http.get("https://brp.com.np/covid/nepal.php");
    var data = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        loading = false;
        dataNepal = [data];
      });
    }
    return null;
  }

  Future<Void> worldData() async {
    var response = await http.get("https://corona.lmao.ninja/all");
    var data = json.decode(response.body);
    if (this.mounted) {
      setState(() {
        loadingS = false;
        dataWorld = [data];
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecf0f1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                decoration:
                    BoxDecoration(shape: BoxShape.rectangle, color: color),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text("Nepal", style: TextStyle(fontSize: 30)),
                    loading
                        ? Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 70,
                                ),
                                CircularProgressIndicator(),
                              ],
                            ),
                          )
                        : Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellowAccent,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30))),
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            dataNepal[0]
                                                    ["latest_stat_by_country"]
                                                [0]["total_cases"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Infected")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      color: Colors.green,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            dataNepal[0]
                                                    ["latest_stat_by_country"]
                                                [0]["total_recovered"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Recovered")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30))),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            dataNepal[0]["latest_stat_by_country"]
                                                        [0]["total_deaths"] ==
                                                    ""
                                                ? "0"
                                                : dataNepal[0][
                                                        "latest_stat_by_country"]
                                                    [0]["total_deaths"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Death")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30))),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            dataNepal[0]
                                                    ["latest_stat_by_country"]
                                                [0]["active_cases"],
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Active Cases")
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      color: Colors.blue[100],
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            dataNepal[0]["latest_stat_by_country"]
                                                        [0]["new_cases"] ==
                                                    ""
                                                ? "0"
                                                : dataNepal[0][
                                                        "latest_stat_by_country"]
                                                    [0]["new_cases"],
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("New Cases")
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(30))),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            dataNepal[0]["latest_stat_by_country"]
                                                            [0]
                                                        ["serious_critical"] ==
                                                    ""
                                                ? "0"
                                                : dataNepal[0][
                                                        "latest_stat_by_country"]
                                                    [0]["serious_critical"],
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Critical Case")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90),
                        bottomRight: Radius.circular(90)),
                    shape: BoxShape.rectangle,
                    color: color),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text("World", style: TextStyle(fontSize: 30)),
                    loadingS
                        ? Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 70,
                                ),
                                CircularProgressIndicator(),
                              ],
                            ),
                          )
                        : Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellowAccent,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30))),
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${dataWorld[0]["cases"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Infected")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      color: Colors.green,
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${dataWorld[0]["recovered"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Recovered")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30))),
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${dataWorld[0]["deaths"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Death")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30))),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${dataWorld[0]["active"]}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Active Cases")
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      color: Colors.blue[100],
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${dataWorld[0]["todayCases"]}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("New Cases")
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.blue[100],
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(30))),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${dataWorld[0]["critical"]}",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 5)),
                                          Text("Critical Case")
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}