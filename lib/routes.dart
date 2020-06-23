import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/index.dart';
import 'package:goodhouse/pages/login/login.dart';
import 'package:goodhouse/pages/register.dart';
import 'package:goodhouse/pages/room_add/index.dart';
// import 'package:goodhouse/pages/not_found.dart';
import 'package:goodhouse/pages/room_detail/index.dart';
import 'package:goodhouse/pages/room_manage/index.dart';
import 'package:goodhouse/pages/search/index.dart';
import 'package:goodhouse/pages/setting.dart';

class Routes {
  static String home="/";
  static String login="/login";
  static String rigister="rigister";
  static String room="/room/:roomId";
  static String search="/search";
  static String setting='/setting';
  static String roomManager="/roomManager";
  static String roomAdd='/roomAdd';

  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomePage();
  });
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
  });
  static Handler _rigisterHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return RigisterPage();
  });
  static Handler _search = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return SearchPage();
  });
  static Handler _setting = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Setting();
  });
  static Handler _roomManager = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return RoomManagePage();
  });
  static Handler _roomAdd = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return RoomAddPage();
  });
  // static Handler _notFoundHandler=Handler(handlerFunc: (BuildContext context, Map<String,dynamic> params) {
  //   return NotFoundPage();
  // });//目前有问题,报The method 'inheritFromWidgetOfExactType' was called on null错误
  
   static Handler _roomDetailPage = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
     print(params);
  return RoomDetailPage(roomId:params['roomId'][0]);
  });



  static  void configureRoutes(Router router) {
  router.define(home, handler: _homeHandler);
  router.define(login,handler:_loginHandler);
  router.define(room,handler:_roomDetailPage);
  router.define(rigister,handler:_rigisterHandler);
  router.define(search,handler:_search);
  router.define(setting,handler:_setting);
  router.define(roomManager,handler:_roomManager);
  router.define(roomAdd,handler:_roomAdd);
  // router.notFoundHandler=_notFoundHandler;//目前有问题,报The method 'inheritFromWidgetOfExactType' was called on null错误
  }
}

