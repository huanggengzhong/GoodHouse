import 'package:flutter/material.dart';
class CommonFloatingButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const CommonFloatingButton(this.title, this.onTap,{Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        if(onTap!=null) onTap();
      },
      child:Container(
        margin: EdgeInsets.all(20.0),
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(10.0),
          color:Colors.green
        ),
        child: Center(
          child:Text(title,style:TextStyle(
            color:Colors.white,
            fontSize:16.0,
            fontWeight:FontWeight.w600
          ))
        ),
      )
    );
  }
}