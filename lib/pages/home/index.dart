import 'package:flutter/material.dart';
import 'package:goodhouse/widgets/page_content.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(//Container组件
      child: PageContent(name:"Home页面"),
    );
  }
}
