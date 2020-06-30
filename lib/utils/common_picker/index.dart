import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPickerWidget {
  // Future返回值showPicker函数方法
  static Future<int> showPicker(
      {BuildContext context, //上下文
      List<String> options, //字符串数组
      int value //选项值
      }) {
        return showCupertinoModalPopup(//半瓶弹框组件
          context: context, builder: (BuildContext context){
            var buttonTyxtStyle=TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600
            );
            return Container(
              color:Colors.grey,
              height:300.0,
              child:Column(
                children: <Widget>[
                  Container(
                    color:Colors.grey[200],
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(onPressed: (){
                        }, child: Text('取消',style: buttonTyxtStyle,)),
                        FlatButton(onPressed: (){
                        }, child: Text('确定',style: buttonTyxtStyle,))
                      ],
                    ),
                  ),
                  Expanded(child: 
                  CupertinoPicker(//滑动组件
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  itemExtent: 32.0,
                  onSelectedItemChanged: (val){},
                    children: options.map((e) => Text(e)).toList(),
                  ))
                ],
              )
            );
          });
      }
}
