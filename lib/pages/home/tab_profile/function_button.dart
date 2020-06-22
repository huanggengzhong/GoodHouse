import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_profile/function_button_widget.dart';

import 'function_button_data.dart';
class FunctionButton extends StatelessWidget {
  const FunctionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        children:list.map((item)=>FunctionButtonWidget(item)).toList(),
      )
    );
  }
}