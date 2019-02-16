import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  GlobalKey key = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool onclick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 10.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          autofocus: true,
                          keyboardType: TextInputType.phone,
                          controller: _nameController,
                          decoration: InputDecoration(
                              labelText: "用户名",
                              hintText: "用户名或邮箱",
                              icon: Icon(Icons.person),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.black45,
                                  ),
                                  onPressed: () {
                                    _nameController.clear();
                                  })),
                          // 校验用户名
                          validator: (v) {
                            return v.trim().length > 0 ? null : "用户名不能为空";
                          }),
                      TextFormField(
                          controller: _pwdController,
                          decoration: InputDecoration(
                              labelText: "密码",
                              hintText: "您的登录密码",
                              icon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    onclick
                                        ? Icons.remove_red_eye
                                        : Icons.panorama_fish_eye,
                                    color: Colors.black45,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      onclick = !onclick;
                                    });
                                  })),
                          obscureText: onclick,
                          //校验密码
                          validator: (v) {
                            return v.trim().length > 5 ? null : "密码不能少于6位";
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: RaisedButton(
                              onPressed: () {
                                if ((key.currentState as FormState)
                                    .validate()) {
                                  print("pass");
                                }
                              },
                              padding: EdgeInsets.all(15.0),
                              child: Text("Login"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                  key: key,
                  autovalidate: false,
                )),
          )
        ],
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
  void didUpdateWidget(LoginPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
