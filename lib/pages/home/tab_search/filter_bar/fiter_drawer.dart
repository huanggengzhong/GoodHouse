import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/data.dart';
import 'package:goodhouse/scoped_model/room_filter.dart';
import 'package:goodhouse/utils/scoped_model_helper.dart';
import 'package:goodhouse/widgets/common_title.dart';
class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用状态数据
   var dataList= ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
   roomTypeList=dataList['roomTypeList'];
   orientedList=dataList['orientedList'];
   floorList=dataList['floorList'];

    // var selectedIds=['bb','aa','99'];
    var selectedIds=ScopedModelHelper.getModel<FilterBarModel>(context).selectedList.toList();//toList的原因是Set类型转成List类型
  print(selectedIds);
    _onChange(String val){
      ScopedModelHelper.getModel<FilterBarModel>(context).selectedListToggleItem(val);
    }
    return Drawer(
      child: SafeArea(//解决ListView在某些手机布局错乱的问题
        child: ListView(
          children:<Widget>[
            CommonTitle("户型"),
            FilterDrawerItem(
              list:roomTypeList,
              selectedIds: selectedIds,
              onChage: _onChange,
            ),//封装成组件
            CommonTitle("朝向"),
              FilterDrawerItem(
              list:orientedList,
              selectedIds: selectedIds,
              onChage: _onChange,
            ),
            CommonTitle("楼层"),
              FilterDrawerItem(
              list:floorList,
              selectedIds: selectedIds,
              onChage: _onChange,
            ),
          ]
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  // 定义参数
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChage;

  const FilterDrawerItem({Key key, this.list, this.selectedIds, this.onChage}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:10.0,right:10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children:list.map((item){
          var isActive=selectedIds.contains(item.id);//如果包含是true
          return GestureDetector(
            onTap: (){
              if(onChage!=null) onChage(item.id);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              
              width: 100.0,
              height: 40.0,
              decoration:BoxDecoration(
                color: isActive?Colors.green:Colors.white,
                border:Border.all(width:1.0,color:Colors.green)
              ),
              child:Center(
                child:Text(item.name,style:TextStyle(
                  color:isActive?Colors.white:Colors.green
                ))
              )
            ),
          );
        }).toList(),
      ),
    );
  }
}
