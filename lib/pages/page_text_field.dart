import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

//添加动画需要SingleTickerProviderStateMixin8/*-4
class _TextFieldPageState extends State<TextFieldPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  var flag = false;
  var sex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

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
              Radio(
                onChanged: (value) {
                  setState(() {
                    sex = value;
                  });
                },
                value: 1,
                groupValue: sex,
              ),
              Radio(
                onChanged: (value) {
                  setState(() {
                    sex = value;
                  });
                },
                value: 2,
                groupValue: sex,
              ),
              Switch(
                value: flag,
                onChanged: (value) {
                  setState(() {
                    flag = !value;
                  });
                },
              ),
              Container(
                width: animation.value,
                height: animation.value,
                child: Text("Animator"),
              )
            ],
          ),
        ));
  }
}
