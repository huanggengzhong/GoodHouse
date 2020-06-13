import 'package:flutter/material.dart';
class CommonTag extends StatelessWidget {
  final String title;//这是外部传递过来的
  final Color color;//自己的
  final Color backgroundColor;
  const CommonTag.origin(this.title,{Key key,this.color=Colors.black,this.backgroundColor}) : super(key: key);//注意外部和自己的写法

  // 工厂函数
  factory CommonTag(String title){
    switch (title) {
      case '近地铁':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.red,
        backgroundColor: Colors.red[50],
      );
      case '集中供暖':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.blue,
        backgroundColor: Colors.blue[50],
      );
      case '新上':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.green,
        backgroundColor: Colors.green[50],
      );
      case '随时看房':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.orange,
        backgroundColor: Colors.orange[50],
      );
        
      default:
      return CommonTag.origin(title);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:4.0),
      padding: EdgeInsets.only(left:4.0,right:4.0,top:4.0,bottom:2.0),
      decoration: BoxDecoration(
        color:backgroundColor,//工厂里自定义的背景
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Text(
        title,//工厂里自定义的文字
        style: TextStyle(
          fontSize:10.0,
          color:color//工厂里自定义的字体颜色
        ),
      ),
    );
  }
}