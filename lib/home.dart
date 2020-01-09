import 'package:defiant/bottom_navigation.dart';
import 'package:flutter/material.dart';

class MainTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTabPageState();
  }

  MainTabPage();
}

class MainTabPageState extends State<MainTabPage> {
  int last = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Material(
          child: BottomNavigation(),
        ),
        onWillPop: _doubleExit);
  }

  int _lastClickTime = 0;

  Future<bool> _doubleExit() {
    int nowTime = DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return Future.value(true);
    } else {
      _showDialog();
      _lastClickTime = DateTime.now().microsecondsSinceEpoch;
      Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      return Future.value(false);
    }
  }

  _showDialog() {
    /*Fluttertoast.showToast(
        fontSize: 16,
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white);*/
  }
}
