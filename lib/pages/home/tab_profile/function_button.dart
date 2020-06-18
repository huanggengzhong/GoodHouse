import 'package:flutter/material.dart';

import 'function_button_data.dart';
class FunctionButton extends StatelessWidget {
  const FunctionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 1.0,
        runSpacing: 1.0,
        children:list.map((item)=>Container(
          height:20.0,
          width:MediaQuery.of(context).size.width*0.33,
          decoration: BoxDecoration(color:Colors.red),
        )).toList(),
      )
    );
  }
}