import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/dataList.dart';
import 'package:goodhouse/widgets/common_image.dart';
 class RoomListItemWidget extends StatelessWidget {
   final RoomListItemData data;
   const RoomListItemWidget(this.data,{Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Container(
       padding:EdgeInsets.only(left:10.0,right:10.0,bottom:10.0),
       child: Row(
         children: <Widget>[
           CommonImage(src:data.imageUrl,width: 132.5,height: 90.0,),
           Padding(padding:EdgeInsets.only(left:10.0) ),
           Expanded(child: //表单组件
           Column(
             crossAxisAlignment:CrossAxisAlignment.start,
             children:<Widget>[
               Text(data.title,maxLines:1,overflow:TextOverflow.ellipsis,style:TextStyle(
                 fontWeight:FontWeight.w600
               )),
               Text(data.subTitle,maxLines:1,overflow:TextOverflow.ellipsis),
               Wrap(children:data.tags.map((item)=>Text(item+';')).toList()),//标签组件
               Text(data.subTitle,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(
                 color:Colors.orange
               ),),

             ]
           ),
           ),
         ],
       )
     );
   }
 }
