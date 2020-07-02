import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  // Future返回值showPicker函数方法
  static Future<int> showPicker(
      {BuildContext context, //上下文
      List<String> options, //字符串数组
      int value //选项值
      }) {
    return showCupertinoModalPopup<int>(
        //半瓶弹框组件
        context: context,
        builder: (BuildContext context) {
          var buttonTextStyle = TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600);
          var controller = FixedExtentScrollController(initialItem: value);
          return Container(
              color: Colors.grey,
              height: 300.0,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey[200],
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            '取消',
                            style: buttonTextStyle,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(controller.selectedItem);
                          },
                          child: Text(
                            '确定',
                            style: buttonTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: CupertinoPicker(//滑动组件
                    scrollController: controller,//记住不要忘记写这个,不然无法关闭弹框,并且无法选中
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    itemExtent: 32.0,
                    onSelectedItemChanged: (val) {},
                    children: options.map((item) => Text(item)).toList(),
                  ))
                ],
              ));
              
        });
  }
}
