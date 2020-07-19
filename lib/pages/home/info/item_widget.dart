import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/data.dart';
import 'package:goodhouse/widgets/common_image.dart';

class ItemWidget extends StatelessWidget {
  final InfoItem data;
  const ItemWidget(this.data,{Key key}) : super(key: key);//记住this.data一定要在前面,并且和后面对象独立

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          CommonImage(
            src: data.imageUrl,
            width: 120.0,
            height: 90.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(data.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(data.source, style: TextStyle(color: Colors.black54)),
                    Text(data.time, style: TextStyle(color: Colors.black54))
                  ],
                )
              ])) //Expanded自动填充组件
        ],
      ),
    );
  }
}
