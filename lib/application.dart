import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/index.dart';
// import 'package:goodhouse/pages/login/login.dart';
import 'package:goodhouse/routes.dart';
import 'package:goodhouse/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 声明一个路由
    Router router = Router();
    Routes.configureRoutes(router);
    return ScopedModel<FilterBarModel>(//使用状态管理数据
      model: FilterBarModel(),
      child: MaterialApp(
        // title: 'goodhouse',//这是标题,目前没什么用
        theme: new ThemeData(
          primarySwatch: Colors.green, //这里设置主题颜色
        ),
        // home: HomePage(),
        // home:LoginPage(),
        onGenerateRoute: router.generator,
        initialRoute: Routes.loading,
      ),
    );
    // MaterialApp(
    //   // title: 'goodhouse',//这是标题,目前没什么用
    //   theme:new ThemeData(
    //     primarySwatch:Colors.green,//这里设置主题颜色
    //   ),
    //   home:HomePage(),
    //   // home:LoginPage(),
    //   onGenerateRoute: router.generator,

    // );
  }
}
