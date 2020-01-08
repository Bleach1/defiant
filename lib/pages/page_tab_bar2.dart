import 'package:flutter/material.dart';

class TabBarPage2 extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage2>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarDemo"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((value) => Tab(
                    text: value,
                    icon: Icon(
                      Icons.flag,
                      color: Colors.green,
                    ),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
            children: <Widget>[
              ListTile(
                title: Text("第一个Tab的标题"),
                subtitle: Text("第一个Tab的副标题"),
                leading: Icon(
                  Icons.access_alarm,
                  color: Colors.amber,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.ac_unit,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: Text("第二个Tab的标题"),
                subtitle: Text("第二个Tab的副标题"),
                leading: Icon(
                  Icons.add_a_photo,
                  color: Colors.amber,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.add_photo_alternate,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          ListView(
            children: <Widget>[
              ListTile(
                title: Text("第三个Tab的标题"),
                subtitle: Text("第三个Tab的副标题"),
                leading: Icon(
                  Icons.add_a_photo,
                  color: Colors.amber,
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.add_photo_alternate,
                    color: Colors.amber,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text('DRAWER HEADER'),
            ),
            Text('DRAWER')
          ],
        ),
      ),
    );
  }
}
