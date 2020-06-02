import 'package:flutter/material.dart';

// import 'package:goodhouse/widgets/page_content.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  // 定义一个bool值
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("登录")),
        body: SafeArea(
          minimum: EdgeInsets.all(30.0),
          child: ListView(children: <Widget>[
            TextField(
              //文本输入框组件
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  suffixIcon: IconButton(
                      icon: Icon(showPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      }) //使用文本框 TextField 自带的属性【后缀图标 suffixIcon】
                  ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print("登录");
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("还没有账号,"),
                FlatButton(
                    child: Text("去注册",style: TextStyle(color:Colors.green),),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'rigister');
                    })
              ],
            )
          ]),
        ));
  }
}
