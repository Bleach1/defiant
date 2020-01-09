import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  var flag=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TextField"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                //密码框 只能 maxLines: 1
                obscureText: true,
                maxLines: 1,
                maxLength: 20,
                decoration: InputDecoration(
                    hintText: "随便输入", border: OutlineInputBorder()),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: flag,
                    onChanged: (value) {
                      setState(() {
                        flag = !value;
                      });
                    },
                    //选中的颜色
                    activeColor: Colors.red,
                  )
                ],
              ),
              CheckboxListTile(
                value: flag,
                onChanged: (value) {
                  setState(() {
                    flag = value;
                  });
                },
                //选中的颜色
                activeColor: Colors.red,
                title: Text("sd"),
                subtitle: Text("dsdsdss"),
                secondary: Icon(Icons.ring_volume),
              ),
            ],
          ),
        ));
  }
}
