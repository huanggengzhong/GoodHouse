### 好客租房App开发

### 练习dart语言的方法
下载code runner插件,dart文件右键运行即可.

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
运行命令,在终端按r会自动刷新模拟器界面.
```js
flutter run 
```

### 编写一个简单页面-实现

**效果：**

<img src="https://tva1.sinaimg.cn/large/006y8mN6ly1g7rz6g19lqj30dx0pkq5e.jpg" alt="image-20191009152217329" style="zoom: 50%;" />

**步骤：**

1. 添加 PageContent 组件(安装Awesome Flutter Snippets
插件有快捷键)
   1. 新建文件 /widgets/page_content.dart
   2. 添加 material 依赖;//importM
   3. 编写无状态组件//StatelessW
   4. 添加 name 参数 //起类名PageContent ,声明name:final String name;点击快速修复生成构造函数
   5. **使用 Scaffold** //返回一个Scaffold
2. 添加 HomePage 页面
   1. 新建文件 /pages/home/index.dart
   2. 添加 material, page_content依赖//import 'package:first_flutter_app/widgets/page_content.dart';
   3. 编写无状态组件
   4. 使用 PageContent
3. 添加 Application 应用根组件
   1. 新建文件 /application.dart
   2. 添加依赖和HomePage界面引入 //可以点击组件后用ctrl+单击自动引入
   3. **使用 MaterialApp** //在main里导入Application
4. 测试

### 路由配置


1. 安装
```js
dependencies:
// 下面有空格,安装好后再通过.lock文件吧版本号写回去
fluro: any
```
2. 添加 /pages/login.dart
3. 参考 /pages/home/index.dart 完善登陆页。
4. 在application里把入口文件改成loginPage


#### 配置步骤
步骤：

1. 编写路由配置文件
   1. 创建 routes.dart 文件 并编写Routes类的基本结构
   2. 定义路由名称
   ```js
   static String home="/";
  static String login="/login";
  ```
   3. 定义路由处理函数
   ```js
   //fluro官网有介绍
   static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomePage();
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
   ```
   4. 编写函数 configureRoutes 关联路由名称和处理函数
   ```js
    static  void configureRoutes(Router router) {
  router.define(home, handler: _homeHandler);
  router.define(login,handler:_loginHandler);
   ```

2. 在 Application 中配置路由
   1. 定义 router 
   2. 通过调用configureRoutes 配置 router
   3. 在 MaterialApp 中使用 router
3. 测试路由
   1. 在 PageContent  中添加跳转按钮

