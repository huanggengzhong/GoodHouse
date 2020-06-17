import 'package:flutter/material.dart';

var loginFontStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Navigator.of(context).pushNamed("register");
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
}
