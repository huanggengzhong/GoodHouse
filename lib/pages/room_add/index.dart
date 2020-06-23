import 'package:flutter/material.dart';

class RoomAddPage extends StatefulWidget {
  RoomAddPage({Key key}) : super(key: key);

  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('发布房源'),
      )
    );
  }
}