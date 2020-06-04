import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index_recommend_item_widget.dart';
import 'package:goodhouse/pages/home/tab_index/index_recommond_data.dart';
class IndexRecommond extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommond({Key key,this.dataList=indexRecommendData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Color(0x08000000)),
      child: Column(
        children:<Widget>[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Text('房屋推荐',style:TextStyle(
                color:Colors.black,
                fontWeight:FontWeight.w600,

              )),
              Text('更多',style:TextStyle(
                color:Colors.black54
              ))
            ]
          ),
          Padding(padding: EdgeInsets.all(5),),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children:dataList.map((item) =>
            IndexRecommendItemWidget(item)
            //  Container(
            //     width: (MediaQuery.of(context).size.width -30.0)/2,
            //     height: 100.0,
            //     decoration: BoxDecoration(color:Colors.white),
            //   )
              ).toList()
          ),
        ]
      ),
    );
  }
}
