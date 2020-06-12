import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/dataList.dart';

class TabSearch extends StatefulWidget {
  TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('tab搜索页'),
      ),
      body:Column(
        children:<Widget>[
          Container(
            height:40.0,
            child:Text('filterBar'),
           
          ),
           Expanded(//表单输入组件
            child: ListView(
              children:dataList.map((item)=>
             Container(
               height:200.0,
               margin:EdgeInsets.only(bottom:10.0),
               decoration: BoxDecoration(color:Colors.green),
             )   
        ).toList()
            ),
           )

        ]
      )
    );
  }
}
