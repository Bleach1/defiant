import 'package:defiant/pages/page_tab_bar.dart';
import 'package:defiant/pages/page_tab_bar2.dart';
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
        child: RaisedButton(
          child: Text('GO TO TAB'),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TabBarPage2()));
          },
        ),
      ),
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
