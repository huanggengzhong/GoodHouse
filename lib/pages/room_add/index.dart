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
          CommonFormItemWidget(//自定义小区
            label: '小区',
            contentBuilder:(context){
              return Container(
                child:GestureDetector(
                  behavior: HitTestBehavior.translucent,//解决点击空白地方无效
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('请选择小区',style:TextStyle(
                        fontSize:16.0
                      )),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  onTap: (){
                    print("跳转选择小区页");
                  },
                )
              );
            }
          ),
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