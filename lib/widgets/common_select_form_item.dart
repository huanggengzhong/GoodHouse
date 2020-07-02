import 'package:flutter/material.dart';
import 'package:goodhouse/utils/common_picker/index.dart';
import 'package:goodhouse/widgets/common_form_item.dart';

class CommonSelectFormItemWedget extends StatelessWidget {
  final String label;
  final int value;
  final List<String> options;
  final Function(int) onChange;

  const CommonSelectFormItemWedget(
      {Key key, this.label, this.value, this.options, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItemWidget(
      label: label,
      contentBuilder: (context) {
        return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              var result=CommonPicker.showPicker(
                context:context,
                options:options,
                value:value
              );
              result.then((selectedValue){
                if(value!=selectedValue&&selectedValue!=null&&onChange!=null){
                  onChange(selectedValue);
                }
              });//回调函数
            },
            child: Container(
              width: 282.0,
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(options[value], style: TextStyle(fontSize: 16.0)),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ));
      },
    );
  }
}
