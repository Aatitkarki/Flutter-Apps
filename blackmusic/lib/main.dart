import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Song> _songs;
  @override
  void initState() async{
    super.initState();
   var songs =await MusicFinder.allSongs();
   songs = List.from(songs);

   setState(() {
     _songs = songs;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Black Player'),
      ),
      body: ListView.builder(
        itemCount:_songs.length ,itemBuilder: (context,int index){
          return ListTile(
            leading: CircleAvatar(
              child: Text(_songs[index].title[0])
            ),
            trailing: Text(_songs[index].title),
          );
        })
      
    );
  }
}

