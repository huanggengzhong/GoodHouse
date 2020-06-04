import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';

final networkUrlRef=RegExp('^http');//网络图片
final localworkUrlRef=RegExp('^static');//本地图片

 class CommonImage extends StatelessWidget {

   final String src;
   final double width;
   final double height;
   final BoxFit fit;//图片的适应模式类型

  const CommonImage({this.src,Key key,  this.width, this.height, this.fit}) : super(key: key);//把this.src放在最前面


 
   @override
   Widget build(BuildContext context) {
    if(networkUrlRef.hasMatch(src)){//正则判断是否网络图片
      return Image(
        width: width,
        height: height,
        fit: fit,
        image: AdvancedNetworkImage(
          src,
          useDiskCache: true,//磁盘缓存
          cacheRule: CacheRule(maxAge:Duration(days:7)),//保存时间
          timeoutDuration: Duration(seconds: 20)//超时时间
        ),
       );
    }
    if(localworkUrlRef.hasMatch(src)){
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }
    assert(false,"图片地址不合法");//抛出异常
    return Container();


   }
 }
