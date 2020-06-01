import 'package:flutter/material.dart';
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:new Text("404页面"),
        
      ),
      body:Center(child:Text("你访问的页面不存在")),
    );
  }
}
// 目前有问题,报The method 'inheritFromWidgetOfExactType' was called on null错误

