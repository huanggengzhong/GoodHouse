
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/dataList.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/fiter_drawer.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/index.dart';
import 'package:goodhouse/widgets/room_list_item_widget.dart';
import 'package:goodhouse/widgets/search_bar/index.dart';

class TabSearch extends StatefulWidget {
  TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   title: Text('tab搜索页'),
      // ),
      // 抽屉组件
      endDrawer: FilterDrawer(),
       appBar:AppBar(
         actions: <Widget>[Container()],//去掉drawer按钮,变成滑动弹出
        title:SearchBar(showLocation: true,showMap: true,onSearch: (){
          Navigator.of(context).pushNamed('search');//跳转到搜索页面
          print("跳转到搜索页面测试");
        },),
        // backgroundColor: Colors.blue,//背景
        backgroundColor: Colors.white,//背景
      ),
      body:Column(
        children:<Widget>[
          Container(
            height:41.0,
            child:FilterBar(
              onChange: (data){},
            ),
           
          ),
           Expanded(//表单输入组件
            child: ListView(
              children:dataList.map((item)=>
            //  Container(
            //    height:200.0,
            //    margin:EdgeInsets.only(bottom:10.0),
            //    decoration: BoxDecoration(color:Colors.green),
            //  )  
            RoomListItemWidget(item)
        ).toList()
            ),
           )

        ]
      )
    );
  }
}
