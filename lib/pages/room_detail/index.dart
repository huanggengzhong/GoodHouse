import 'package:flutter/material.dart';
import 'package:goodhouse/pages/room_detail/data.dart';
import 'package:goodhouse/widgets/common_title.dart';
import 'package:share/share.dart';

var bottomButtonTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  final String roomId;
  const RoomDetailPage({Key key, this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData data;
  bool isLike = false;
  @override
  void initState() {
    // TODO: implement initState
    data = defaultData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (null == data) return Container();
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
        body: Stack(
          children: <Widget>[
            ListView(children: <Widget>[
              CommonTitle('房屋配置'),
              CommonTitle('房屋概况'),
              CommonTitle('猜你喜欢'),
            ]),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              bottom: 0,
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLike = !isLike;
                        });
                      },
                      child: Container(
                          height: 50.0,
                          width: 40.0,
                          margin: EdgeInsets.only(right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(isLike ? Icons.star : Icons.star_border,
                                  size: 24.0,
                                  color: isLike ? Colors.green : Colors.black),
                              Text(isLike ? '已收藏' : '收藏',
                                  style: TextStyle(fontSize: 12.0))
                            ],
                          )),
                    ),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50.0,
                              margin: EdgeInsets.only(right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: Center(
                                child:
                                    Text('联系房东', style: bottomButtonTextStyle),
                              ),
                            ))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50.0,
                              margin: EdgeInsets.only(right: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: Center(
                                child:
                                    Text('预约看房', style: bottomButtonTextStyle),
                              ),
                            ))),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
