import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages=[
   'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth=750.0;
var imageHeight=424.0;
var imageWidgetHeightRatio=imageWidth/imageHeight;//宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChage;//值改变事件
  CommonImagePicker({Key key}) : super(key: key);
  @override
  _CommonImagePickerState createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files=[];
  //添加图片的方法
  _pickImage () async {
    var Image= await ImagePicker.pickImage(source: ImageSource.gallery);
    if(null==image) return;
    setState(() {
      files=files..add(image);//..是自动返回
      
    });
    if(widget.onChage!=null){
      widget.onChage(files);
    }
  }
  @override
  Widget build(BuildContext context) {
    var width=(MediaQuery.of(context).size.width-10.0*4)/3;
    var height=width/imageWidgetHeightRatio;
    //+组件
    Widget addButton=GestureDetector(
      onTap: (){
        _pickImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width:width,
        height:height,
        color:Colors.grey,
        child:Center(
          child:Text('+',style:TextStyle(
            fontSize:40.0,fontWeight:FontWeight.w100
          ))
        )
      ),

    );

    Widget wrapper (File file){
      return Stack(//叠加布局组件
      overflow: Overflow.visible,//超出总是显示
      children: <Widget>[
        Image.file(file,width: width,height: height,fit: BoxFit.cover,),
        Positioned(
          right: -20.0,
          top: -20.0,
          child: IconButton(icon: Icons.delete_forever, onPressed: (){
            setState(() {
              files=files..remove(file);
            });
            if(null!=widget.onChange){
              widget.onChage(files);
            }
          }),
        )
      ],

      );
    }

    List<Widget> list =files.map((item) => wraper(item)).toList();//wrapper组件
    ..add(addButton);
    return Container(
      padding: EdgeInsets.all(10.0),
       child: Wrap(//流式布局组件,会自动换行
         spacing:10.0,//主轴上间隙
         runSpacing:10.0,//副轴间隙
        children: list,//list数组组件
       )  
    );
  }
}
