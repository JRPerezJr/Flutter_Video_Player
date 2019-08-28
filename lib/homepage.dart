import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController _controller;

  String screenText = "";
  String screenSubText = "";
  Timer timer;
  int position = 0;
  List<String> screenTextList = ["Welcome", "Browse", "Search"];
  List<String> screenSubTextList = [
    "Signup for a free subscription to my YouTube channel.",
    "Please like and subscribe.",
    "Looking for a special video, please checkout my playlist."
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/bunny.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    Timer.periodic(Duration(seconds: 15), (Timer t) {
      setState(() {
        screenText = screenTextList[position];
        screenSubText = screenSubTextList[position];
        position++;
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Container(
                    child: Text(
                      screenText,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Container(
                    child: Text(
                      screenSubText,
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text('LOG IN'),
                      onPressed: () {},
                      color: Color(0xff222327),
                      textColor: Colors.yellow,
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      splashColor: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text('SIGN IN'),
                      onPressed: () {},
                      color: Color(0xff648f01),
                      textColor: Colors.yellow,
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      splashColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
