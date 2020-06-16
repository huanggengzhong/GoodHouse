import 'package:flutter/material.dart';
class TabProfile extends StatelessWidget {
  const TabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('我的'),
        actions:<Widget>[//右侧组件
          IconButton(
            onPressed: (){
              // Navigator.of(context).pushNamed(routeName);
              print("准备跳转到设置页");
            },
            icon:Icon(Icons.settings),
          )
        ]
      ),
      
      body:ListView(
        children: <Widget>[
          Text('内容区域')
        ],
      )
    );
  }
}