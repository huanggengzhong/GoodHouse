import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/index.dart';
import 'package:goodhouse/pages/home/tab_profile/advertisement.dart';
import 'package:goodhouse/pages/home/tab_profile/function_button.dart';
import 'package:goodhouse/pages/home/tab_profile/function_button_data.dart';
import 'package:goodhouse/pages/home/tab_profile/header.dart';
class TabProfile extends StatelessWidget {
  const TabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,//去掉边框
        title:Text('我的'),
        actions:<Widget>[//右侧组件
          IconButton(
            onPressed: (){
              print("准备跳转到设置页");
              Navigator.of(context).pushNamed("setting");
            },
            icon:Icon(Icons.settings),
          )
        ]
      ),
      
      body:ListView(
        children: <Widget>[
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(showTitle:true),//启用当初设置的title
          // Text('内容区域')
        ],
      )
    );
  }
}
