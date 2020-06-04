import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index_navigator.dart';
import 'package:goodhouse/widgets/common_swipper.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("首页tab")
      ),
      body:ListView(
        children:<Widget>[
          CommonSwipper(),
          IndexNavigator(),
          Text("内容")
        ]
      )
    );
  }
}
