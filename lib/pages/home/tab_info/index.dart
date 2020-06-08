import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/index.dart';
class TabInfo extends StatefulWidget {
  TabInfo({Key key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('资讯tab'),

      ),
      body:ListView(
        children:<Widget>[
          Info(),
          Info(),
          Info(),
        ]
      )
    );
  }
}