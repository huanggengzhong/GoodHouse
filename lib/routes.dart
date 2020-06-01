import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/index.dart';
import 'package:goodhouse/pages/login/login.dart';
import 'package:goodhouse/pages/not_found.dart';

class Routes {
  static String home="/";
  static String login="/login";

  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return HomePage();
  });
  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
  });
  // static Handler _notFoundHandler=Handler(handlerFunc: (BuildContext context, Map<String,dynamic> params) {
  //   return NotFoundPage();
  // });//目前有问题,报The method 'inheritFromWidgetOfExactType' was called on null错误
  
  static Handler _notFoundHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return NotFoundPage();
  });


  static  void configureRoutes(Router router) {
  router.define(home, handler: _homeHandler);
  router.define(login,handler:_loginHandler);
  // router.notFoundHandler=_notFoundHandler;//目前有问题,报The method 'inheritFromWidgetOfExactType' was called on null错误
  }
}

