import 'package:flutter/material.dart';
import 'package:goodhouse/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool showLocation; //位置
  final Function goBackCallback; //回退
  final String inputValue; //搜索框值
  final String defaultInputValue; //默认显示值
  final Function onCancel; //取消按钮
  final bool showMap; //地图按钮
  final Function onSearch; //点击搜索框触发
  final ValueChanged<String> onSearchSubmit; //点击按键回车触发

  const SearchBar(
      {Key key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue,
      this.defaultInputValue,
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          if (widget.showLocation != null || true)
            //location判断
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                //手势组件
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.room, color: Colors.green, size: 16.0),
                    Text('北京',
                        style: TextStyle(color: Colors.black, fontSize: 14.0))
                  ],
                ),
              ),
            ),
          if (widget.goBackCallback != null || true)
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(children: <Widget>[
                      Icon(Icons.chevron_left, color: Colors.black87)
                    ]))),
          Expanded(
              //自适应组件
              child: Container(
            height: 34.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.grey[200]),
            margin: EdgeInsets.only(right: 10.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: '请输入搜索词',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: -2.0, left: -10.0),
                  suffixIcon: Icon(
                    //后置图标
                    Icons.clear,
                    size: 18.0,
                    color: Colors.grey,
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                  )),
            ),
          )),
          if (widget.onCancel != null || true)
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(children: <Widget>[
                      Text('取消',
                          style: TextStyle(color: Colors.black, fontSize: 14.0))
                    ]))),
          if (widget.showMap != null || true)
            CommonImage(src: 'static/icons/widget_search_bar_map.png')
        ],
      ),
    );
  }
}
