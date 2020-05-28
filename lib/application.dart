import 'package:flutter/material.dart';
import 'package:goodhouse/pages/home/index.dart';
class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage()
    );
  }
}
