import 'package:flutter/material.dart';
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
        return Container(
          width: 282.0,
          height: 40.0,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(options[value], style: TextStyle(fontSize: 16.0)),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
        );
      },
    );
  }
}
