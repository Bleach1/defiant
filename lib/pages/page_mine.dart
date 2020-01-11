import 'package:defiant/pages/page_tab_bar.dart';
import 'package:defiant/pages/page_tab_bar2.dart';
import 'package:defiant/pages/page_text_field.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  MinePageState createState() => MinePageState();
}

class MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MinePage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('GO TO TAB'),
              color: Colors.lightBlue,
              textColor: Colors.white,
              elevation: 3,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TabBarPage2()));
              },
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: RaisedButton(
                      //水波纹
                      splashColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      textColor: Colors.white,
                      color: Colors.amber,
                      child: Text("HASAKI"),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => TextFieldPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton.icon(
                //null  enable
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart),
                label: Text("ICON")),

            OutlineButton(
              child: Text("边框按钮"),
              //边框颜色
              disabledBorderColor: Colors.deepOrangeAccent,
              //字体颜色
              disabledTextColor: Colors.amber,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Click"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(MinePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
