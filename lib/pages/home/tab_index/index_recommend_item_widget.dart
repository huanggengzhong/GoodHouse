import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index_recommond_data.dart';
import 'package:goodhouse/widgets/common_image.dart';

var textStyle=TextStyle(fontSize:14.0,fontWeight:FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;
  
  const IndexRecommendItemWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//手势组件
      onTap: (){
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          color:Colors.white,
        ),
        width:(MediaQuery.of(context).size.width-30.0)/2,
        padding: EdgeInsets.all(10.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Column(
              children: <Widget>[
                Text(data.title,style:textStyle),
                Text(data.subTitle,style:textStyle),
              ],
            ),
            CommonImage(src:data.imageUrl,width:55.0)
          ]
        )
      ),
    );
  }
}
