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
      home: ExampleApp(),
    );
  }
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => new _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {

  MusicFinder audioPlayer;

  @override
  initState() {
    super.initState();
    audioPlayer = new MusicFinder();
    fetchSongs();
  }

  Future fetchSongs() async {
    List<Song> songs;
    try {
      songs = await MusicFinder.allSongs();
    } catch(e) {
      print(e.toString());
    }

    if (songs.isNotEmpty) {
      audioPlayer.play(songs.first.uri);
    }
  }

  @override
  void dispose() {
    audioPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flute Music Player Example'),
        ),
        body: Container(),
      ),
    );
  }
}

