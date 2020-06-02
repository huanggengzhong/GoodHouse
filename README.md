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

````js
import 'package:goodhouse/routes.dart';
   Router router=Router();
 Routes.configureRoutes(router);
 ```
6. 测试路由
在page_content文件中添加按钮查看效果.
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
3. 在 /routes.dart 添加 _roomDetailPage
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
```js
TextField(
         decoration: InputDecoration(
           labelText:"密码",
           hintText:"请输入密码",
           suffixIcon:IconButton(icon:Icon(
             showPassword?Icons.visibility_off:Icons.visibility
           ),
            onPressed: (){
              setState(() {
                showPassword=!showPassword;
              });
            }) //使用文本框 TextField 自带的属性【后缀图标 suffixIcon】
         ),
       ),
````

3. 添加状态— showPassword

```js
bool showPassword=false;
```

4. 根据状态展示不同内容
5. 给图标添加点击事件
6. 测试

#### 细节优化
边距/异形屏幕问题？
使用 SafeArea(解决超出问题)
```js
minimum: EdgeInsets.all(30.0)//解决padding问题
```
垂直高度不足问题？
使用 ListView(不够可以滚动) 替代 Column

### 添加注册页面
步骤：

1. 添加文件 /pages/register.dart
2. 将login.dart 文件拷贝到 register.dart
3. 修改类名称
4. 修改 title
5. 在路由中添加 register
   1. 添加 route name
   2. 添加 route handler
   3. 在 configureRoutes 中关联 name 和router
6. 修改了组件类型，需要重启app后测试
##### 注册页面优化
步骤：

1. 删除密码显示逻辑
2. 添加确认密码
3. 修改按钮及下方链接到文案
4. 优化登陆注册跳转，使用 Navigator.pushReplacementNamed
```js
Navigator.pushReplacementNamed(context, 'login');//可以删除记录
```

