import 'package:flutter/material.dart';
import 'package:goodhouse/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool showLocation; //是否显示位置
  final Function goBackCallback; //回退
  final String inputValue; //搜索框值
  final String defaultInputValue; //默认显示值
  final Function onCancel; //取消按钮
  final bool showMap; //是否显示地图按钮
  final Function onSearch; //点击搜索框触发
  final ValueChanged<String> onSearchSubmit; //点击按键回车触发

  const SearchBar(
      {Key key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = "",
      this.defaultInputValue = "请输入搜索词",
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  TextEditingController _controller; //输入框的控制器
  FocusNode _focus; //焦点声明
  _onClean() {
    _controller.clear(); //清除输入框控制器
    setState(() {
      _searchWord = '';
    });
  }

  // 初始化控制器
  @override
  void initState() {
    _focus = FocusNode(); //初始化焦点
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          if (widget.showLocation != null)
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
          if (widget.goBackCallback != null)
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
              // 优化start
              focusNode: _focus,
              onTap: (){
                if(widget.onSearchSubmit==null) {
                  _focus.unfocus();//解决回退失去焦点问题
                }
              widget.onSearch(); //使用自己定义的变量方法

              },
              onSubmitted: widget.onSearchSubmit,
              textInputAction: TextInputAction.search, //按键变为搜索
              controller: _controller, //自己定义的控制器
              onChanged: (String value) {
                //值改变问题
                setState(() {
                  _searchWord = value;
                });
              },
              // 优化end
              decoration: InputDecoration(
                  hintText: '请输入搜索词',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: -2.0, left: -10.0),
                  suffixIcon: GestureDetector(
                    //触摸控件
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      //后置图标
                      Icons.clear,
                      size: 18.0,
                      color: _searchWord == ''
                          ? Colors.grey[200]
                          : Colors.grey, //去图标的技巧:当空时设置为没颜色
                    ),
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
          if (widget.onCancel != null)
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(children: <Widget>[
                      Text('取消',
                          style: TextStyle(color: Colors.black, fontSize: 14.0))
                    ]))),
          if (widget.showMap != null)
            CommonImage(src: 'static/icons/widget_search_bar_map.png')
        ],
      ),
    );
  }
}
