import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            //可以将TabBar放在title中实现
            title: Text("TabBarDemo"),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "热门",
                  icon: Icon(
                    Icons.flag,
                    color: Colors.green,
                  ),
                ),
                Tab(
                  text: "推荐",
                  icon: Icon(
                    Icons.flag,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
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
            ],
          ),
        ),
      ),
    );
  }
}
