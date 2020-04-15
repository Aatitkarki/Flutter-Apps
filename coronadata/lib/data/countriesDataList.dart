import 'package:flutter/material.dart';

class CountryData extends StatelessWidget {
  final List lstCountry;

  CountryData({this.lstCountry});
  @override
  Widget build(BuildContext context) {
    print("The data is");
    print(lstCountry);
    bool loading = false;
    return ListView(
      padding: EdgeInsets.all(5),
      children: <Widget>[
        loading
            ? Center(
                heightFactor: 20,
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: lstCountry == null
                    ? 0
                    : lstCountry[0]["countries_stat"].length,
                itemBuilder: (context, i) {
                  return listItem(i);
                })
      ],
    );
  }

  Widget listItem(int i) {
    return Column(
      children: <Widget>[
        Center(
            child: Text(
          lstCountry[0]["countries_stat"][i]["country_name"],
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        )),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(30)),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          lstCountry[0]["countries_stat"][i]["cases"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
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
                          lstCountry[0]["countries_stat"][i]["total_recovered"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
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
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(30))),
                    child: Column(
                      children: <Widget>[
                        Text(
                          lstCountry[0]["countries_stat"][i]["deaths"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                        Text("Total Deaths")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30))),
                    child: Column(
                      children: <Widget>[
                        Text(
                          lstCountry[0]["countries_stat"][i]["active_cases"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
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
                          lstCountry[0]["countries_stat"][i]["new_cases"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
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
                            bottomRight: Radius.circular(30))),
                    child: Column(
                      children: <Widget>[
                        Text(
                          lstCountry[0]["countries_stat"][i]
                              ["serious_critical"],
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                        Text("Critical Case")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
