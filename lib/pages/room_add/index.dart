import 'package:flutter/material.dart';
import 'package:goodhouse/widgets/common_floating_button.dart';
import 'package:goodhouse/widgets/common_form_item.dart';
import 'package:goodhouse/widgets/common_title.dart';

class RoomAddPage extends StatefulWidget {
  RoomAddPage({Key key}) : super(key: key);

  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('发布房源'),
      ),
      floatingActionButton: CommonFloatingButton('提交', (){
        print("点击了提交");
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:ListView(
        children:<Widget>[
          CommonTitle('房源信息'),
          CommonFormItemWidget(
            label: '租金',
            hitText:'请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItemWidget(
            label: '大小',
            hitText:'请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonTitle('房屋头像'),
          CommonTitle('房屋标题'),
          CommonTitle('房屋配置'),
          CommonTitle('房屋描述'),
        ]
      ),
    );
  }
}