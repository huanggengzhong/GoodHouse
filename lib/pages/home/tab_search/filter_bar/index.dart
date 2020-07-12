import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/data.dart';
import 'package:goodhouse/pages/home/tab_search/filter_bar/item.dart';
import 'package:goodhouse/utils/common_picker/index.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;
  const FilterBar({Key key, this.onChange}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  //4个按钮状态
  bool isAreaActive = false;
  bool isTentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;
//4个按钮结果值
  String areaId = '';
  String rentTypeId = '';
  String priceTypeId = '';
  List<String> moreId = [];
//4个响应事件
  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    // 弹框
    var result = CommonPicker.showPicker(
        context: context,
        value: 0,
        options: areaList.map((item) => item.name).toList());
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
    }).whenComplete(//完成后的回调
        () {
      setState(() {
        isAreaActive = false;
      });
    });
    _onChange();
  }

  _onRentTypeChange(context) {
     setState(() {
      isTentTypeActive = true;
    });
    // 弹框
    var result = CommonPicker.showPicker(
        context: context,
        value: 0,
        options: rentTypeList.map((item) => item.name).toList());
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = rentTypeList[index].id;
      });
    }).whenComplete(//完成后的回调
        () {
      setState(() {
        isTentTypeActive = false;
      });
    });
    _onChange();
  }

  _onPriceChange(context) {
      setState(() {
      isPriceActive = true;
    });
    // 弹框
    var result = CommonPicker.showPicker(
        context: context,
        value: 0,
        options: priceList.map((item) => item.name).toList());
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = priceList[index].id;
      });
    }).whenComplete(//完成后的回调
        () {
      setState(() {
        isPriceActive = false;
      });
    });
    _onChange();
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();//通过点击筛选,用api方式打开侧边drawer
  }

//添加通知外层的方法,以便外层调用
  _onChange() {
    if (widget.onChange != null) {
      widget.onChange(FilterBarResult(
          areaId: areaId,
          rentTypeId: rentTypeId,
          priceTypeId: priceTypeId,
          moreId: moreId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isTentTypeActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          Item(
            title: '筛选',
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
