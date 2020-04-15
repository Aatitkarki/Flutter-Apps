import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeveloperInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text("About Developer"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.commentDots, color: Colors.black54),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black54),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container(
              margin: const EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Text(
                  "I am a undergraduate student of BSc.Hons Computing at Ithari International College. I have a deep interest towards computer science. I want to develop my career as a Software Developer. I am a hard worker and quick learner."),
            ),
            _buildTitle("Skills"),
            _buildSkillRow("Flutter", 0.75),
            _buildSkillRow("WordPress", 0.5),
            _buildSkillRow("Java", 0.4),
            _buildSkillRow("Python", 0.3),
            _buildSkillRow("JavaScript", 0.80),
            _buildTitle("Education"),
            _buildEducationColumn(
                "Shree Satyadevi Secondary School", "SEE", "2073"),
            _buildEducationColumn(
                "Vishwa Adarsha Secondary School", "Plus Two", "2074-2075"),
            _buildEducationColumn("London Metropolitan University",
                "Bsc Hons Computing", "2076-Continue"),
            _buildTitle("Contact"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.mail),
                      SizedBox(
                        width: 16,
                      ),
                      Text("aatitkarki123@gmail.com")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.phone),
                      SizedBox(
                        width: 16,
                      ),
                      Text("+977-9824785214")
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        FontAwesomeIcons.github,
                        color: Colors.blueAccent,
                        size: 40,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEducationColumn(String institution, String level, String year) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              FontAwesomeIcons.solidCircle,
              size: 12,
              color: Colors.black38,
            ),
          ),
          title: Text(institution),
          subtitle: Text(level + "($year)"),
        )
      ],
    );
  }

  Widget _buildSkillRow(String skill, double level) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              backgroundColor: Colors.redAccent,
              value: level,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black38,
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: CircleAvatar(
                radius: 40,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    "images/sk.JPG",
                  ),
                )),
          ),
          Column(
            children: <Widget>[
              Text("Suresh Karki"),
              Text("Android/IOS developer "),
              Row(children: <Widget>[
                Icon(Icons.map),
                SizedBox(width: 10,),
                Text("Itahari,Nepal")
              ],)
            ],
          )
        ],
      ),
    );
  }
}
