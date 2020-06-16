import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/index.dart';
import 'package:goodhouse/widgets/search_bar/index.dart';
class TabInfo extends StatefulWidget {
  TabInfo({Key key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}


   
class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   title: Text('资讯tab'),

      // ),
       appBar:AppBar(
        title:SearchBar(onSearch: (){
          Navigator.of(context).pushNamed('search');//跳转到搜索页面
          print("跳转到搜索页面测试");
        },),
        backgroundColor: Colors.white,
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
