import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:defiant/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/MainPage': (ctx) => MainTabPage(),
      },
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _goMain() {
    Navigator.of(context).pushReplacementNamed('/MainPage');
  }

  var flag = false;

  @override
  void initState() {
    super.initState();
    Future<bool> isFirstFlag = get();
    isFirstFlag.then((isFirst) {
      print(isFirst == true);
      flag = isFirst;
      if (isFirst) {
        countDown();
      }
    });
  }

  int currentCount = 5000;
  int currentTime;

  void countDown() {
    var timer = TimerUtil();
    timer.setTotalTime(currentCount);
    timer.setOnTimerTickCallback((time) {
      setState(() {
        currentTime = time ~/ 1000;
        if (currentTime == 0) {
          _goMain();
          timer.cancel();
        }
      });
    });
    timer.startCountDown();
  }

  save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("first", true);
  }

  Future<bool> get() async {
    var first;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    first = prefs.getBool("first");
    return first;
  }

  Widget _buildSplash() {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "images/splash_logo.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          height: 25.0,
          width: 80.0,
          child: FlatButton(
            onPressed: _goMain,
            child: Text("Skip ${currentTime}s"),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(20.0)),
          ),
          top: 35.0,
          right: 15.0,
        )
      ],
    );
  }

  Widget _buildBanner() {
    save();
    final List<Widget> widgets = [];
    var _pageController = PageController(initialPage: 0);
    widgets.add(Image.asset(
      "images/guide1.png",
      fit: BoxFit.cover,
    ));
    widgets.add(Image.asset(
      "images/guide2.png",
      fit: BoxFit.cover,
    ));
    widgets.add(Image.asset(
      "images/guide3.png",
      fit: BoxFit.cover,
    ));
    widgets.add(Image.asset(
      "images/guide4.png",
      fit: BoxFit.cover,
    ));

    return Scaffold(
        body: PageView.builder(
      itemBuilder: (context, index) {
        return index == 3
            ? Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  widgets[index],
                  Positioned(
                    bottom: 18.0,
                    right: 18.0,
                    child: RaisedButton(
                      textTheme: ButtonTextTheme.normal,
                      elevation: 5.0,
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        _goMain();
                      },
                      child: Text("立即进入"),
                    ),
                  )
                ],
              )
            : widgets[index];
      },
      onPageChanged: (index) {},
      //onPageChanged: _pageChanged,
      itemCount: 4,
      scrollDirection: Axis.horizontal,

      controller: _pageController,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: flag,
            child: _buildBanner(),
          ),
          Offstage(
            offstage: !flag,
            child: _buildSplash(),
          ),
        ],
      ),
    );
  }
}
