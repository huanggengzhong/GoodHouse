import 'package:goodhouse/pages/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';



class FilterBarModel extends Model {
  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];

  Set<String> _selectedList = Set<String>();
  // 读数据方法
  Map<String, List<GeneralType>> get dataList {
    var result = Map<String, List<GeneralType>>();
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;
    return result;
  }

  // 写数据方法
  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList'];
    _orientedList = data['orientedList'];
    _floorList = data['floorList'];
    notifyListeners();
  }

// _selectedList 对应的函数方法
// 读取数据
  Set<String> get selectedList {
    return _selectedList;
  }

// 设置数据
  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners();
  }
}
