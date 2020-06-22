import 'package:flutter/material.dart';

import '../../../widgets/common_image.dart';
class Advertisement extends StatelessWidget {
  const Advertisement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:30.0,bottom:20.0,left:10.0,right:10.0),
      child: CommonImage(src:'https://tva1.sinaimg.cn/large/006y8mN6ly1g6te62n8f4j30j603vgou.jpg')
    );
  }
}