import 'package:flutter/material.dart';
// import 'package:goodhouse/widgets/page_content.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("登录")
      ),
      body:Column(
        children: <Widget>[
          TextField(//文本输入框组件
          decoration:InputDecoration(
            labelText:'用户名',
            hintText:'请输入用户名'
          ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText:"密码",
              hintText:"请输入密码"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("还没有账号,"),
              FlatButton(
                child: Text("去注册"),
                onPressed: (){
                Navigator.pushNamed(context, 'register');
              })
            ],
          )
          
        ]
      )
    );
  }
}
