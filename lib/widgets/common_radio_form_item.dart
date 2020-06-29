import 'package:flutter/material.dart';

import 'common_form_item.dart';

class CommonRadioFormIten extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged<int> onChange;

  const CommonRadioFormIten(
      {Key key, this.label, this.options, this.value, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItemWidget(
      label: label,
      contentBuilder: (context) {
       return Container(
         width: 282.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
              List.generate(options.length, (index) => Row(
                children: <Widget>[
                  Radio(value: index, groupValue: value, onChanged: onChange),
                  Text(options[index])
                ],
              ))
            
          )
          );
      },
    );
  }
}
