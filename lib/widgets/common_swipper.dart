import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:goodhouse/widgets/common_image.dart';

//定义图片数组
const List<String> defaultImage=[
   'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];
//准备轮播大小
var imageWidth=750.0;//750px
var imageHeight=424.0;

class CommonSwipper extends StatelessWidget {
  final List<String> images;
  const CommonSwipper({Key key,this.images=defaultImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.width/imageWidth*imageHeight;// 符号/前面是获取屏幕的高度
    return Container(
      height:height,
      // height: 100.0,//不要写死高度
      child: new Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return CommonImage(
          // return new Image.network(
            src:images[index],
            fit:BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
        ),
    );
  }
}
