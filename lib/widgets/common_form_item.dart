import 'package:flutter/material.dart';

class CommonFormItemWidget extends StatelessWidget {
  final String label;
  final Widget Function(BuildContext context) contentBuilder;
  final Widget suffix;
  final String suffixText;
  final String hitText;
  final ValueChanged onChanged;
  final TextEditingController contronller;

  const CommonFormItemWidget({Key key, this.label, this.contentBuilder, this.suffix, this.suffixText, this.hitText, this.onChanged, this.contronller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width:100.0,
            child:Text(
              label,
              style:TextStyle(fontSize:16.0,color:Colors.black87)
            )
          ),
          
        ],
      )
    );
  }
}