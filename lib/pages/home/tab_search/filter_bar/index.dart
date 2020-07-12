import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/data.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/item.dart';
class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;
  const FilterBar({Key key, this.onChange}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: BoxDecoration(
        border:Border(bottom:BorderSide(color:Colors.black12,width: 1.0))
      ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           Item(
             title: '区域',
             isActive:true,
             onTap: (context){},
           ),
           Item(
             title: '方式',
             isActive:false,
             onTap: (context){},
           ),
           Item(
             title: '租金',
             isActive:false,
             onTap: (context){},
           ),
           Item(
             title: '筛选',
             isActive:false,
             onTap: (context){},
           ),
         ],
       ),
    );
  }
}
