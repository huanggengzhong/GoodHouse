### 好客租房 App 开发

### 练习 dart 语言的方法

下载 code runner 插件,dart 文件右键运行即可.

#### 项目创建

项目【菜单】— 【查看】—【命令面板】— 【Flutter：New Project】
测试页面代码:lib/main.dart

```js
import 'package:flutter/material.dart';
void main ()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:const Text("Home")
        ),
      )
    );
  }
}
```

运行命令,在终端按 r 会自动刷新模拟器界面.

```js
flutter run
```

### 编写一个简单页面-实现

**效果：**

<img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g7rz6g19lqj30dx0pkq5e.jpg" alt="image-20191009152217329" style="zoom: 50%;" />

**步骤：**

1. 添加 PageContent 组件(安装 Awesome Flutter Snippets
   插件有快捷键)
   1. 新建文件 /widgets/page_content.dart
   2. 添加 material 依赖;//importM
   3. 编写无状态组件//StatelessW
   4. 添加 name 参数 //起类名 PageContent ,声明 name:final String name;点击快速修复生成构造函数
   5. **使用 Scaffold** //返回一个 Scaffold
2. 添加 HomePage 页面
   1. 新建文件 /pages/home/index.dart
   2. 添加 material, page_content 依赖//import 'package:first_flutter_app/widgets/page_content.dart';
   3. 编写无状态组件
   4. 使用 PageContent
3. 添加 Application 应用根组件
   1. 新建文件 /application.dart
   2. 添加依赖和 HomePage 界面引入 //可以点击组件后用 ctrl+单击自动引入
   3. **使用 MaterialApp** //在 main 里导入 Application
4. 测试

### 路由配置

1. 安装

```js
dependencies:
// 下面有空格,安装好后再通过.lock文件吧版本号写回去
fluro: any
如果安装不了,可以参考另一种方法https://blog.csdn.net/xiaodi520520/article/details/99672182
```

2. 添加 /pages/login.dart
3. 参考 /pages/home/index.dart 完善登陆页。
4. 在 application 里把入口文件改成 loginPage

#### 配置步骤

步骤：

1.  创建 routes.dart 文件 并编写 Routes 类的基本结构
2.  定义路由名称

```js
static String home="/";
static String login="/login";
```

3.  定义路由处理函数

```js
//fluro官网有介绍
static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
return HomePage();
static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
return LoginPage();
```

4.  编写函数 configureRoutes 关联路由名称和处理函数

```js
 static  void configureRoutes(Router router) {
router.define(home, handler: _homeHandler);
router.define(login,handler:_loginHandler);
```

5.  在 Application 中引入和调用路由

```js
import 'package:goodhouse/routes.dart';
   Router router=Router();
 Routes.configureRoutes(router);

```

6. 测试路由
   在 page_content 文件中添加按钮查看效果.

```js
 FlatButton(child:Text(Routes.home),onPressed:(){
         Navigator.pushNamed(context,Routes.home);
       }),
       FlatButton(child:Text(Routes.login),onPressed:(){
         Navigator.pushNamed(context,Routes.login);
       }),

```

### 优化路由(参数传递)

带参数页面处理

1. 在 /pages 目录添加 room_detail/index.dart 文件
2. 实现 RoomDetailPage
3. 在 /routes.dart 添加 \_roomDetailPage
4. 在 /routes.dart 的 configureRoutes 中添加 RoomDetailPage;
5. 修改 PageContent 测试

### 登录页面

#### scafford

- appBar
- title— Text
- body
- 用户名— TextField
- 密码— TextField
- 登陆按钮— RaisedButton
- 注册链接— Row[Text,FlatButton]

#### 添加密码显示与隐藏

1. 将无状态组件改成有状态组件— 快速方法组件名右键重构
2. 添加可点击的图标— IconButton

`````js
TextField(
  ​       decoration: InputDecoration(
  ​         labelText:"密码",
  ​         hintText:"请输入密码",
  ​         suffixIcon:IconButton(icon:Icon(
  ​           showPassword?Icons.visibility_off:Icons.visibility
  ​         ),
  ​          onPressed: (){
  ​            setState(() {
  ​              showPassword=!showPassword;
  ​            });
  ​          }) //使用文本框 TextField 自带的属性【后缀图标 suffixIcon】
  ​       ),
  ​     ),
​````

3. 添加状态— showPassword

​```js
bool showPassword=false;
`````

4. 根据状态展示不同内容
5. 给图标添加点击事件
6. 测试

#### 细节优化

边距/异形屏幕问题？
使用 SafeArea(解决超出问题)

```js
minimum: EdgeInsets.all(30.0); //解决padding问题
```

垂直高度不足问题？
使用 ListView(不够可以滚动) 替代 Column

### 添加注册页面

步骤：

1. 添加文件 /pages/register.dart
2. 将 login.dart 文件拷贝到 register.dart
3. 修改类名称
4. 修改 title
5. 在路由中添加 register
   1. 添加 route name
   2. 添加 route handler
   3. 在 configureRoutes 中关联 name 和 router
6. 修改了组件类型，需要重启 app 后测试

##### 注册页面优化

步骤：

1. 删除密码显示逻辑
2. 添加确认密码
3. 修改按钮及下方链接到文案
4. 优化登陆注册跳转，使用 Navigator.pushReplacementNamed

```js
Navigator.pushReplacementNamed(context, "login"); //可以删除记录
```

### 首页开始

参考官方代码:
(注意我的环境有两处要改)

```js
// fontSize: 30
   fontSize: 30.0
// selectedItemColor: Colors.amber[800],
   fixedColor:Colors.blue,
```

修改后的代码如下:

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/widgets/page_content.dart';

// 1. 需要准备 4 个 tab 内容区（tabView）
List<Widget> tabViewList = [
  PageContent(name: '首页'),
  PageContent(name: '搜索'),
  PageContent(name: '咨询'),
  PageContent(name: '我的'),
];

// 2. 需要准备 4 个 BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
  BottomNavigationBarItem(title: Text('搜索'), icon: Icon(Icons.search)),
  BottomNavigationBarItem(title: Text('咨询'), icon: Icon(Icons.info)),
  BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.account_circle)),
];

// 3. 编写有状态组件
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
```

### 首页第一屏页面

#### 底部 tab 实现

步骤：

1. 新建文件 /pages/home/tab_index/index.dart
2. 添加依赖，编写无状态组件
3. 简化实现顶部区域--appBar
4. body 部分包含多个组件且可以滚动—使用 ListView
5. 在 home/index.dart 中使用 TabIndex 组件

```js
List < Widget > tabViewList = [
  TabIndex(),
  // PageContent(name: '首页'),
  PageContent((name: "搜索")),
  PageContent((name: "咨询")),
  PageContent((name: "我的"))
];
```

#### 轮播图的实现

步骤：

1. 准备组件框架代码
   1. 新建文件 /widgets/common_swipper.dart
   2. 添加依赖 material 和 flutter_swiper
   3. 准备图片数据
   4. 编写无状态组件
   5. 添加 images 参数 并在构造函数中赋值
2. 编写 swiper 核心代码
   1. 参照官网使用 swipper
   2. 修改 itemBuilder 和 itemCount
   3. Swiper 父组件指定高度
   ```js
   //父组件获取屏幕高度的固定方法
   var width = MediaQuery.of(context).size.width;
   ```
3. 测试

   1. 在 tabIndex 中使用 CommonSwiper

#### 首页导航

1.数据准备

```js
import 'package:flutter/material.dart';

//准备数据:title,image
class IndexNavigatorItem {
  final String title;
  final String imageUrl;
  final Function (BuildContext contenxt) onTap;
  IndexNavigatorItem(this.title,this.imageUrl,this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList=[
  IndexNavigatorItem('整租','static/images/home_index_navigator_total.png',(BuildContext context){
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('合租','static/images/home_index_navigator_share.png',(BuildContext context){
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('地图找房','static/images/home_index_navigator_map.png',(BuildContext context){
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('去出租','static/images/home_index_navigator_rent.png',(BuildContext context){
    Navigator.of(context).pushNamed('login');
  }),
];
```

2. 添加依赖 material 和 index_navigator_item
3. 编写无状态组件
4. 完成页面结构

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index_navigator_item.dart';
class IndexNavigator extends StatelessWidget {
  const IndexNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top:6.0,bottom:6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: indexNavigatorItemList
        .map((item)=>InkWell(//InkWell可以实现水波纹效果
          onTap: (){
            item.onTap(context);
          },
          child: Column(
            children:<Widget>[
              Image.asset(item.imageUrl,
              width:47.5,),
              Text(item.title,style:TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500
              ))

            ]
          ),
        )).toList()//转化成List
      ),
    );
  }
}

```

### 使用图片缓存进行封装

步骤：

1. 准备
   1. 安装 flutter_advanced_networkimage: ^0.5.0 依赖
   2. 添加文件 /widgets/common_image.dart
   3. 引入两个依赖
   4. 编写 正则 根据图片地址判断是网络图片还是本地图片
   ```js
   final networkUrlRef=RegExp('^http');//网络图片
   final localworkUrlRef=RegExp('^static');//本地图片
   ```

2) 编写框架代码
   1. 编写无状态组件
   2. 完善组件参数 src width height fit
3) 完成核心逻辑

   1. 如果是网络图片，使用 flutter_advanced_networkimage
   2. 如果是本地图片，使用 Image.asset
   3. 返回 Container

```js
import 'dart:html';
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

```

4. 使用 CommonImage

```js
CommonImage((src: item.imageUrl), (width: 47.5));
```

### 首页-tabIndex-推荐-准备

1.数据准备

```js
class IndexRecommendItem{
   final String title;
   final String subTitle;
   final String imageUrl;
   final String navigateUrl;
   const IndexRecommendItem(this.title,this.subTitle,this.imageUrl,this.navigateUrl);
}

const List<IndexRecommendItem> indexRecommendData=[
  const IndexRecommendItem(
    '家住回龙观','归属的感觉', 'static/images/home_index_recommend_1.png', 'login'),

  const IndexRecommendItem(
    '宜居四五环', '大都市生活','static/images/home_index_recommend_2.png', 'login'),

  const IndexRecommendItem(
    '喧嚣三里屯', '繁华的背后','static/images/home_index_recommend_3.png', 'login'),
  const IndexRecommendItem(
     '比邻十号线','地铁心连心', 'static/images/home_index_recommend_4.png', 'login'),
];

```

步骤：

1. 准备

   1. 使用上一节准备好的数据
   2. 新建文件 pages/home/tab_index/index_recommond.dart

2. 编写核心代码
   1. 添加依赖，无状态组件，dataList 参数，indexRecommendData 改成常量
   2. 添加背景色及边距
   3. 添加 wrap
3. 测试

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index_recommond_data.dart';
class IndexRecommond extends StatelessWidget {
  final List<IndexRecommendItem> dataList;

  const IndexRecommond({Key key,this.dataList=indexRecommendData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Color(0x08000000)),
      child: Column(
        children:<Widget>[
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Text('房屋推荐',style:TextStyle(
                color:Colors.black,
                fontWeight:FontWeight.w600,

              )),
              Text('更多',style:TextStyle(
                color:Colors.black54
              ))
            ]
          ),
          Padding(padding: EdgeInsets.all(5),),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children:dataList.map((e) => Container(
                width: (MediaQuery.of(context).size.width -30.0)/2,
                height: 100.0,
                decoration: BoxDecoration(color:Colors.red),
              )).toList()
          ),
        ]
      ),
    );
  }
}


```

优化提取 item

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_index/index_recommond_data.dart';
import 'package:goodhouse/widgets/common_image.dart';

var textStyle=TextStyle(fontSize:14.0,fontWeight:FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//手势组件
      onTap: (){
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          color:Colors.white,
        ),
        width:(MediaQuery.of(context).size.width-30.0)/2,
        padding: EdgeInsets.all(10.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Column(
              children: <Widget>[
                Text(data.title,style:textStyle),
                Text(data.subTitle,style:textStyle),
              ],
            ),
            CommonImage(src:data.imageUrl,width:55.0)
          ]
        )
      ),
    );
  }
}

```

### 资讯部分

数据准备 home/info/data.dart

```js
// 资讯数据准备,注意下面的格式

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;
  final String navigateUrl;
  const InfoItem(
      {this.title, this.imageUrl, this.source, this.time, this.navigateUrl});
}

const List<InfoItem> infoData = [
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
];

```

内容编码 info/index.dart

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/data.dart';
import 'package:goodhouse/pages/home/info/item_widget.dart';

class Info extends StatelessWidget {
  final bool showTitle;//考虑到资讯和首页有些显示,所以采用复用
  final List<InfoItem> dataList;

  const Info({Key key,this.showTitle=false, this.dataList=infoData}) : super(key: key);//infoData是data.dart文件内容


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget>[
          if(showTitle)Container(
            alignment:Alignment.centerLeft,
            padding:EdgeInsets.all(10.0),
            child:Text('最新资讯',style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600))
          ),
          Column(
            children:dataList.map((myitem) =>

            //  Container(
            //   height:100.0,
            //   margin:EdgeInsets.only(bottom:10.0),
            //   decoration:BoxDecoration(color:Colors.red),
            // )
            ItemWidget(myitem)
            ).toList(),
          )
        ]
      ),
    );
  }
}

```

子选项内容 info/item_widget.dat

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/info/data.dart';
import 'package:goodhouse/widgets/common_image.dart';

class ItemWidget extends StatelessWidget {
  final InfoItem data;
  const ItemWidget(this.data,{Key key}) : super(key: key);//记住this.data一定要在前面,并且和后面对象独立

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          CommonImage(
            src: data.imageUrl,
            width: 120.0,
            height: 90.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Text(data.title,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(data.source, style: TextStyle(color: Colors.black54)),
                    Text(data.time, style: TextStyle(color: Colors.black54))
                  ],
                )
              ])) //Expanded自动填充组件
        ],
      ),
    );
  }
}
```

### 首页资讯 tab_info 页面

创建 tab_info/index.dart 文件,复用 info 文件内容渲染即可
在 home/index.dart 中将第三个资讯 tabViewList 改为 TabInfo().

### 首页搜索页面

数据准备:tab_search/dataList.dart
**步骤：**

1. 创建文件 /pages/home/tab_search/dataList.dart 使用上一节准备的数据
2. 创建文件 /pages/home/tab_search/index.dart
3. 引入依赖，创建有状态组件
4. 编写主体结构(使用列表组件和搜索组件分离)

```js
import 'package:flutter/material.dart';

import 'dataList.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tabSearch'),),
      body: Column(children: <Widget>[
        Container(
          height: 40.0,
          child: Text('filterBar'),),
          Expanded(child: ListView(
            children: dataList.map((item)=>Container(
              height: 200.0,
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(color: Colors.grey),
            )).toList(),
          ),)
      ],),

    );
  }
}
```

然后封装 item 和 tags:
common_tag.dart(中间用工厂构造函数)/room_list_item_widget.dart
工厂函数用法：

```js
import 'package:flutter/material.dart';
class CommonTag extends StatelessWidget {
  final String title;//这是外部传递过来的
  final Color color;//自己的
  final Color backgroundColor;
  const CommonTag.origin(this.title,{Key key,this.color=Colors.black,this.backgroundColor}) : super(key: key);//注意外部和自己的写法

  // 工厂函数
  factory CommonTag(String title){
    switch (title) {
      case '近地铁':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.red,
        backgroundColor: Colors.red[50],
      );
      case '集中供暖':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.blue,
        backgroundColor: Colors.blue[50],
      );
      case '新上':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.green,
        backgroundColor: Colors.green[50],
      );
      case '随时看房':
      return CommonTag.origin(
        title,//title子不变，其它值都改变
        color:Colors.orange,
        backgroundColor: Colors.orange[50],
      );

      default:
      return CommonTag.origin(title);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:4.0),
      padding: EdgeInsets.only(left:4.0,right:4.0,top:4.0,bottom:2.0),
      decoration: BoxDecoration(
        color:backgroundColor,//工厂里自定义的背景
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Text(
        title,//工厂里自定义的文字
        style: TextStyle(
          fontSize:10.0,
          color:color//工厂里自定义的字体颜色
        ),
      ),
    );
  }
}
```

### 搜索组件封装开发

步骤：

1. 创建文件 /widgets/search_bar/index.dart
2. 引入 material 依赖， 创建有状态组件，添加参数
3. 编写界面代码
4. 测试

```js
import 'package:flutter/material.dart';
import 'package:goodhouse/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  final bool showLocation; //是否显示位置
  final Function goBackCallback; //回退
  final String inputValue; //搜索框值
  final String defaultInputValue; //默认显示值
  final Function onCancel; //取消按钮
  final bool showMap; //是否显示地图按钮
  final Function onSearch; //点击搜索框触发
  final ValueChanged<String> onSearchSubmit; //点击按键回车触发

  const SearchBar(
      {Key key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = "",
      this.defaultInputValue = "请输入搜索词",
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  TextEditingController _controller; //输入框的控制器
  FocusNode _focus; //焦点声明
  _onClean() {
    _controller.clear(); //清除输入框控制器
    setState(() {
      _searchWord = '';
    });
  }

  // 初始化控制器
  @override
  void initState() {
    _focus = FocusNode(); //初始化焦点
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          if (widget.showLocation != null)
            //location判断
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                //手势组件
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Icon(Icons.room, color: Colors.green, size: 16.0),
                    Text('北京',
                        style: TextStyle(color: Colors.black, fontSize: 14.0))
                  ],
                ),
              ),
            ),
          if (widget.goBackCallback != null)
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(children: <Widget>[
                      Icon(Icons.chevron_left, color: Colors.black87)
                    ]))),
          Expanded(
              //自适应组件
            child: Container(
            height: 34.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.grey[200]),
            margin: EdgeInsets.only(right: 10.0),
            child: TextField(
              // 优化start
              focusNode: _focus,
              onTap: (){
                if(widget.onSearchSubmit==null) {
                  _focus.unfocus();//解决回退失去焦点问题
                }
              widget.onSearch(); //使用自己定义的变量方法

              },
              onSubmitted: widget.onSearchSubmit,
              textInputAction: TextInputAction.search, //按键变为搜索
              controller: _controller, //自己定义的控制器
              onChanged: (String value) {
                //值改变问题
                setState(() {
                  _searchWord = value;
                });
              },
              // 优化end
              decoration: InputDecoration(
                  hintText: '请输入搜索词',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: -2.0, left: -10.0),
                  suffixIcon: GestureDetector(
                    //触摸控件
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      //后置图标
                      Icons.clear,
                      size: 18.0,
                      color: _searchWord == ''
                          ? Colors.grey[200]
                          : Colors.grey, //去图标的技巧:当空时设置为没颜色
                    ),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 8.0),
                    child: Icon(
                      Icons.search,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                  )),
            ),
          )),
          if (widget.onCancel != null)
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Row(children: <Widget>[
                      Text('取消',
                          style: TextStyle(color: Colors.black, fontSize: 14.0))
                    ]))),
          if (widget.showMap != null)
            CommonImage(src: 'static/icons/widget_search_bar_map.png')
        ],
      ),
    );
  }
}



```

#### 主页搜索页使用封装好的搜索组件

````js
  appBar:AppBar(
        title:SearchBar(showLocation: true,showMap: true,onSearch: (){
          // Navigator.of(context).pushNamed('search');//跳转到搜索页面
          print("跳转到搜索页面测试");
        },),
        backgroundColor: Colors.white,
      ),
      ```
````

### 我的页面
创建tab_profile/index.dart
```js
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/tab_profile/header.dart';
class TabProfile extends StatelessWidget {
  const TabProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,//去掉边框
        title:Text('我的'),
        actions:<Widget>[//右侧组件
          IconButton(
            onPressed: (){
              // Navigator.of(context).pushNamed(routeName);
              print("准备跳转到设置页");
            },
            icon:Icon(Icons.settings),
          )
        ]
      ),
      
      body:ListView(
        children: <Widget>[
          Header(),
          Text('内容区域')
        ],
      )
    );
  }
}

```
#### 准备头部header.dart
```js
import 'package:flutter/material.dart';

var loginFontStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);
Widget _noLoginPageHeader(BuildContext context){
   return Container(
      decoration: BoxDecoration(color: Colors.green),
      height: 95.0,
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      child: Row(children: <Widget>[
        Container(
          height: 65.0,
          width: 65.0,
          margin: EdgeInsets.only(right: 15.0),
          child: CircleAvatar(
            //圆形头像
            backgroundImage: NetworkImage(
                "https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbgbqv2nj30i20i2wen.jpg"),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 6.0)),
            Row(
              children: <Widget>[
                GestureDetector(
                  //手势组件
                  onTap: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: Text('登录', style: loginFontStyle),
                ),
                Text("/", style: loginFontStyle),
                GestureDetector(
                  //手势组件
                  onTap: () {
                    print("点击了注册");
                    Navigator.of(context).pushNamed("rigister");
                  },
                  child: Text('注册', style: loginFontStyle),
                ),
              ],
            ),
            Text('登录后可以体验更多',style:TextStyle(color:Colors.white))
          ],
        )
      ]),
    );
}
Widget _loginPageHeader(BuildContext context){
  String userName="张三";
  String userImage="https://tva1.sinaimg.cn/large/006y8mN6ly1g6tbnovh8jj30hr0hrq3l.jpg";
   return Container(
      decoration: BoxDecoration(color: Colors.green),
      height: 95.0,
      padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
      child: Row(children: <Widget>[
        Container(
          height: 65.0,
          width: 65.0,
          margin: EdgeInsets.only(right: 15.0),
          child: CircleAvatar(
            //圆形头像
            backgroundImage: NetworkImage(userImage),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 6.0)),
            Row(
              children: <Widget>[
               
                Text(userName, style: loginFontStyle),
               
              ],
            ),
            Text('查看编辑个人资料',style:TextStyle(color:Colors.white))
          ],
        )
      ]),
    );
}

  @override
  Widget build(BuildContext context) {
    var isLogin=false;
   return isLogin ?_noLoginPageHeader(context):_loginPageHeader(context);
  }
}


```
### 功能按钮
1.准备数据文件  pages/home/tab_profile/function_button_data.dart
```js
import 'package:flutter/material.dart';

class FunctionButtonItem{
  final String imageUrl;
  final String title;
  final Function onTapHandle;
  FunctionButtonItem(this.imageUrl,this.title,this.onTapHandle);
}

final List<FunctionButtonItem> list=[
  FunctionButtonItem('static/images/home_profile_record.png', "看房记录", (){}),
  FunctionButtonItem('static/images/home_profile_order.png', '我的订单', null),
  FunctionButtonItem('static/images/home_profile_favor.png', '我的收藏', null),
  FunctionButtonItem('static/images/home_profile_id.png', '身份认证', null),
  FunctionButtonItem('static/images/home_profile_message.png', '联系我们', null),
  FunctionButtonItem('static/images/home_profile_contract.png', '电子合同', null),
  FunctionButtonItem('static/images/home_profile_wallet.png', '钱包', null),
  FunctionButtonItem('static/images/home_profile_house.png', "房屋管理", (context){
    bool isLogin=true;//假设先设置未登录
    if(isLogin){
      Navigator.pushNamed(context, 'login');
    }
  })
  
];
```
创建function_button.dart组件
```js
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
```