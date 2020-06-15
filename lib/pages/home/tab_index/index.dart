import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/index.dart';
import 'package:goodhouse/pages/home/tab_index/index_navigator.dart';
import 'package:goodhouse/pages/home/tab_index/index_recommend.dart';
import 'package:goodhouse/widgets/common_swipper.dart';
import 'package:goodhouse/widgets/search_bar/index.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:SearchBar(showLocation: true,showMap: true,onSearch: (){
          // Navigator.of(context).pushNamed('search');//跳转到搜索页面
          print("跳转到搜索页面测试");
        },),
        backgroundColor: Colors.white,
      ),
      body:ListView(
        children:<Widget>[
          CommonSwipper(),
          IndexNavigator(),
          IndexRecommond(),
          Info(showTitle:true),
        ]
      )
    );
  }
}
