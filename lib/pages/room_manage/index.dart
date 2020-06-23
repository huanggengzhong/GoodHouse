import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/dataList.dart';
import 'package:goodhouse/widgets/common_floating_button.dart';
import 'package:goodhouse/widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,//tab个数
        initialIndex: 0,//初始索引
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//悬浮位置
          floatingActionButton: CommonFloatingButton('发布房源', (){
            Navigator.of(context).pushNamed("roomAdd");
          }),
          appBar: AppBar(
            title:  Text('房屋管理'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text:'空置'),
                Tab(text:'已租'),
              ]
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children:dataList.map((item)=>
                RoomListItemWidget(item)
                ).toList()
              ),
              ListView(
                children:dataList.map((item)=>
                RoomListItemWidget(item)
                ).toList()
              )
            ]
          ),
        ),
      );
    
  }
}


