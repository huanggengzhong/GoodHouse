import 'package:flutter/material.dart';
import 'package:goodhouse/routes.dart';

class PageContent extends StatelessWidget {
  final String name;
  const PageContent({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold组件
      appBar: AppBar(
        title: Text('当前组件:$name'),
      ),
      body: ListView(children: <Widget>[
        FlatButton(
            child: Text(Routes.home),
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            }),
        FlatButton(
            child: Text(Routes.login),
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            }),
        // FlatButton(
        //   child: Text('不存在的页面'),
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/aaaa');
        //   },
        // ),

      ]),
    );
  }
}
