import 'package:flutter/material.dart';
import 'package:goodhouse/pages/room_detail/data.dart';
import 'package:share/share.dart';

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({Key key, this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData data;
  @override
  void initState() {
    // TODO: implement initState
    data=defaultData;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(null==data) return Container();
    return Scaffold(
      appBar: AppBar(
      // title: Text('roomId:${widget.roomId}'),
      title: Text(data.title),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share('https://baidu.com');
            }),
      ],
    ),
    // body: Stack(
    //   children:<Widget>[
    //     ListView(
    //       children:<Widget>[]
    //     )
    //   ],
    //   Positioned(
    //     width:MediaQuery.of(context).size.width,
    //     height: 100.0,
    //     bottom: 0.00,
    //     child: Container(
    //       color:Colors.grey[200]
    //     ),
    //   )
    // ) ,
    );
  }
}
