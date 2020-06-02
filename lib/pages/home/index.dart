import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index.dart';
import 'package:goodhouse/widgets/page_content.dart';

// 1. 需要准备 4 个 tab 内容区（tabView）
List<Widget> tabViewList = [
  TabIndex(),
  // PageContent(name: '首页'),
  PageContent(name: '搜索'),
  PageContent(name: '咨询'),
  PageContent(name: '我的'),
];

// 2. 需要准备 4 个 BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
  BottomNavigationBarItem(title: Text('搜索'), icon: Icon(Icons.search)),
  BottomNavigationBarItem(title: Text('咨询'), icon: Icon(Icons.info)),
  BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.account_circle)),
];

// 3. 编写有状态组件
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
