import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/data.dart';
import 'package:goodhouse/pages/home/info/item_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;//考虑到资讯和首页有些显示,所以采用复用
  final List<InfoItem> dataList;

  const Info({Key key,this.showTitle=false, this.dataList=infoData}) : super(key: key);//infoData是data.dart文件内容
 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          if(showTitle)Container(
            alignment:Alignment.centerLeft,
            padding:EdgeInsets.all(10.0),
            child:Text('最新资讯',style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600))
          ),
          Column(
            children:dataList.map((myitem) =>
            
            //  Container(
            //   height:100.0,
            //   margin:EdgeInsets.only(bottom:10.0),
            //   decoration:BoxDecoration(color:Colors.red),
            // )
            ItemWidget(myitem)
            ).toList(),
          )
        ]
      ),
    );
  }
}
