import 'package:flutter/material.dart';
class SearchBar extends StatefulWidget {
  final bool showLocation;//位置
  final Function goBackCallback;//回退
  final String inputValue;//搜索框值
  final String defaultInputValue;//默认显示值
  final Function onCansel;//取消按钮
  final bool showMap;//地图按钮
  final Function onSearch;//点击搜索框触发
  final ValueChanged<String> onSearchSubmit;//点击按键回车触发


 const SearchBar({Key key,
  this.showLocation,
 this.goBackCallback,
 this.inputValue,
 this.defaultInputValue,
 this.onCansel,
 this.showMap,
 this.onSearch,
 this.onSearchSubmit
 }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: child,
    );
  }
}
