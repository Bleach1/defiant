import 'package:flutter/material.dart';
import 'package:defiant/pages/page_home.dart';
import 'package:defiant/pages/page_mine.dart';
import 'package:defiant/pages/page_msg.dart';

class BottomNavigation extends StatefulWidget {
  @override
  BottomNavigationState createState() => new BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentPageIndex = 0;
  List<Widget> widgets = List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: widgets[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home), title: new Text("首页")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.message), title: new Text("消息")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text("我的")),
        ],
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widgets..add(HomePage())..add(MsgPage())..add(MinePage());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(BottomNavigation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
