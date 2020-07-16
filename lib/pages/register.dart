import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:goodhouse/utils/common_toast.dart';
import 'package:goodhouse/utils/dio_http.dart';
import 'package:goodhouse/utils/string_is_null_or_empty.dart';

// import 'package:goodhouse/widgets/page_content.dart';
class RigisterPage extends StatefulWidget {
  const RigisterPage({Key key}) : super(key: key);

  @override
  RigisterPageState createState() {
    return new RigisterPageState();
  }
}

class RigisterPageState extends State<RigisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  // 注册方法
  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      CommontToast.showToast('两次输入密码不一致!');
      return;
    }
    if(stringIsNullOrEmpty(username)||stringIsNullOrEmpty(password)) {
      CommontToast.showToast("用户名或者密码不能为空");
      return;
    }
    const url="/register";
    var params ={'username':username,'password':password};

    var res=await DioHttp.of(context).post(url,params);
    var resString=json.decode(res.toString());
    print(resString);
    print(resString.data.code.contains('0'));
    if(resString.data.code.contains('0')){
      CommontToast.showToast("登录成功!");
    }

  }

  // 定义一个bool值
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("注册")),
        body: SafeArea(
          minimum: EdgeInsets.all(30.0),
          child: ListView(children: <Widget>[
            TextField(
              controller: usernameController,
              //文本输入框组件
              decoration: InputDecoration(labelText: '用户名', hintText: '请输入用户名'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                // 注册页面不需要
                // suffixIcon: IconButton(
                //     icon: Icon(showPassword
                //         ? Icons.visibility_off
                //         : Icons.visibility),
                //     onPressed: () {
                //       setState(() {
                //         showPassword = !showPassword;
                //       });
                //     }) //使用文本框 TextField 自带的属性【后缀图标 suffixIcon】
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            TextField(
              controller: repeatPasswordController,
              decoration: InputDecoration(
                labelText: "确认密码",
                hintText: "请再次输入密码",
                // 注册页面不需要
                // suffixIcon: IconButton(
                //     icon: Icon(showPassword
                //         ? Icons.visibility_off
                //         : Icons.visibility),
                //     onPressed: () {
                //       setState(() {
                //         showPassword = !showPassword;
                //       });
                //     }) //使用文本框 TextField 自带的属性【后缀图标 suffixIcon】
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text(
                "注册",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // print("注册");
                _registerHandler();
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("已有账号,"),
                FlatButton(
                    child: Text(
                      "去登录",
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                      // Navigator.pushNamed(context, 'login');
                    })
              ],
            )
          ]),
        ));
  }
}
